"
" ~/.vimrc (https://github.com/otaviof/vim_confs)
"

let apleader= ','

let leader=','
let localleader=","
let mapleader=","
let maplocalleader=','

nnoremap ' `
nnoremap ` '

filetype off

source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax   enable
filetype plugin on
filetype indent on

if has("autocmd")
    source ~/.vim/augroup.vim
endif
source ~/.vim/set_globals.vim

runtime macros/matchit.vim


" ----------------------------------------------------------------------------
" -- Methods and special maps for them:
" ----------------------------------------------------------------------------

""" Returns Current Directory
function! CurDir()
    let curdir = substitute( getcwd(), $HOME, "~", "g" )
    return curdir
endfunction

""" Completing words
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

inoremap <D-/> <C-R>=Mosh_Tab_Or_Complete()<CR>

""" Perl Completion Behavior
function! PerlCompletionBehavior()
    let behavs = {'perl':[]}
    call add(behavs.perl, {
        \ 'command' : "\<D-/>",
        \ 'pattern' : printf('\w->\k\{%d,}$',1),
        \ 'repeat' : 0,
        \ })
    return behavs
endf

""" Perl function declaration
function! GotoSub(subname)
    let files  = []

    " find paths to modules with that sub
    let paths = split(system("ack --perl -l 'sub\\s+".a:subname."' lib t/lib"), "\n")

    if empty(paths)
        echomsg("Subroutine '".a:subname."' not found")
    else
        let file = PickFromList('file', paths)
        execute "edit +1 " . file

        " jump to where that sub is defined
        execute "/sub\\s\\+"  . a:subname . "\\>"
    endif
endfunction

function! PickFromList( name, list, ... )
    let forcelist = a:0 && a:1 ? 1 : 0

    if 1 == len(a:list) && !forcelist
        let choice = 0
    else
        let lines = [ 'Choose a '. a:name . ':' ]
            \ + map(range(1, len(a:list)), 'v:val .": ". a:list[v:val - 1]')
        let choice  = inputlist(lines)
        if choice > 0 && choice <= len(a:list)
            let choice = choice - 1
        else
            let choice = choice - 1
        endif
    end

    return a:list[choice]
endfunction

noremap <Localleader>gm :call GotoSub(expand('<cword>'))<cr>


" ----------------------------------------------------------------------------
" -- Mappings:
" ----------------------------------------------------------------------------

" Open and edit vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" TaskList Plugin
map <leader>j <Plug>TaskList

" Perl Deparse
nnoremap <silent> <Localleader>d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> <Localleader>d :!perl -MO=Deparse 2>/dev/null<cr>

" Perl tidy-up coding style
noremap <leader>t mz:%!perltidy -q<CR>'z:delmarks z<CR>

" Perl extract subroutines
vnoremap <leader>sub :! ~/.vim/bin/extract_sub <CR>

" JSON tidy-up
noremap <leader>jt mz:%!json_xs -f json -t json-pretty<CR>'z:delmarks z<CR>

" Java Completion
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 

" Spelling checking for pt_BR and en_US
map <Localleader>s :runtime ~/.vim/spell/<CR>:set spl=pt,en spell<CR>

" UTF8 conversion
nmap <Localleader>utf8 !recode -q ISO-8859-1..utf-8

" Shortcuts for Tabs (Command on OS X)
if has("gui_mac") || has("gui_macvim")
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> 10g
endif

" Display margin
map <Localleader>m <ESC>:match rightMargin /.\%>79v/<CR>
map <Localleader>M <ESC>:match rightMargin <CR>

" NERDTree
let g:NERDTreeShowBookmarks=1
map <Localleader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <silent> <Localleader>f :call FindInNERDTree()<CR>

" TagList
nnoremap <silent>  <F6> :Tlist<CR>
nnoremap <silent>  <F5> :TlistUpdate<CR>
nnoremap <silent> <tab> :bn<CR


" ----------------------------------------------------------------------------
" -- Plugins Options:
" ----------------------------------------------------------------------------

" Perl Options
let g:def_perl_comp_bfunction=1
let g:def_perl_comp_packagen=1
let perl_extended_vars=1
let perl_fold=1
let perl_include_pod=1
let perl_no_sync_on_global_var=1
let perl_no_sync_on_sub=1
let perl_nofold_packages=1
let perl_nofold_subs=0
let perl_string_as_statement=0
let perl_sync_dist=100
let perl_want_scope_in_variables=1

" Tag List Options
let Tlist_Auto_Highlight_Tag=1
let Tlist_Compact_Format=0
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Process_File_Always=1
let Tlist_Show_One_File=0
let Tlist_WinWidth=35
let tlist_perl_settings='perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD'

" Delimate options
let b:delimitMate="(:),[:],{:},<:>"
let b:delimitMate_autoclose=1
let b:delimitMate_expand_cr=1
let b:delimitMate_expand_space=1
let b:delimitMate_matchpairs="(:),[:],{:},<:>"
let b:delimitMate_quotes="\" ' ` *"
let b:delimitMate_visual_leader="f"

" XMLEDIT
let xml_tag_completion_map="<C-l>"
let xml_tag_syntax_prefixes='html\|xml'
let xml_use_xhtml=1

" Not loading some menus
let BASH_LoadMenus='no'
let C_LoadMenus='no'
let Perl_LoadMenus='no'


" ----------------------------------------------------------------------------
" -- Git bindings:
" ----------------------------------------------------------------------------

nnoremap ,gd :GitDiff<Enter>
nnoremap ,gD :GitDiff --cached<Enter>
nnoremap ,gs :GitStatus<Enter>
nnoremap ,gl :GitLog<Enter>
nnoremap ,ga :GitAdd<Enter>
nnoremap ,gA :GitAdd <cfile><Enter>
nnoremap ,gc :GitCommit<Enter>
nnoremap ,gp :GitPullRebase<Enter>
nnoremap ,gP :GitPush<Enter>


" ----------------------------------------------------------------------------
" -- NeoComplCache (http://www.vim.org/scripts/script.php?script_id=2620):
" ----------------------------------------------------------------------------

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns={}
endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup() 
inoremap <expr><C-e> neocomplcache#cancel_popup() 

map <leader>N :NeoComplCacheDisable<CR>

" EOF
