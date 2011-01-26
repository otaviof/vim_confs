" ----------------------------------------------------------------------------
" ~/.vimrc
" ----------------------------------------------------------------------------

let leader=','
let mapleader= ','
let maplocalleader=','

set notitle

nnoremap ' `
nnoremap ` '

filetype on
filetype plugin on
filetype indent on

if &t_Co > 1
    syntax enable
endif

source ~/.vim/set_globals.vim

if has("autocmd")
    source ~/.vim/augroup.vim
endif

runtime macros/matchit.vim

" ----------------------------------------------------------------------------
" Methods and special maps for them
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
fun! PerlCompletionBehavior()
    let behavs = {'perl':[]}
    call add(behavs.perl, {
        \ 'command' : "\<D-/>",
        \ 'pattern' : printf('\w->\k\{%d,}$',1),
        \ 'repeat' : 0,
        \ })
    return behavs
endf

let g:acp_behavior = {}
cal extend(g:acp_behavior, PerlCompletionBehavior(), 'keep')

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

noremap <LocalLeader>gm :call GotoSub(expand('<cword>'))<cr>


" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" Open and edit vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" TaskList Plugin
map <leader>j <Plug>TaskList

" Perl Deparse
nnoremap <silent> <LocalLeader>d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> <LocalLeader>d :!perl -MO=Deparse 2>/dev/null<cr>

" Perl tidy-up coding style
noremap <Leader>t mz:%!perltidy -q<CR>'z:delmarks z<CR>

" Perl extract subroutines
vnoremap <leader>sub :! ~/.vim/bin/extract_sub <CR>

" JSON tidy-up
noremap <Leader>jt mz:%!json_xs -f json -t json-pretty<CR>'z:delmarks z<CR>

" Java Completion
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 

" Spelling checking for pt_BR and en_US
map <LocalLeader>s :runtime ~/.vim/spell/<CR>:set spl=pt,en spell<CR>

" UTF8 conversion
nmap <LocalLeader>utf8 !recode -q ISO-8859-1..utf-8

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
map <LocalLeader>m <ESC>:match rightMargin /.\%>79v/<CR>
map <LocalLeader>M <ESC>:match rightMargin <CR>

" NERDTree
let g:NERDTreeShowBookmarks = 1
map <LocalLeader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <silent> <LocalLeader>f :call FindInNERDTree()<CR>
map <leader>b :FuzzyFinderBuffer<CR>

" TagList
nnoremap <silent>  <F6> :Tlist<CR>
nnoremap <silent>  <F5> :TlistUpdate<CR>
nnoremap <silent> <tab> :bn<CR


" ----------------------------------------------------------------------------
" Plugins Options
" ----------------------------------------------------------------------------

" ACP (Omni Completion)
let g:acp_enableAtStartup = 1

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
let xml_tag_completion_map = "<C-l>"
let xml_tag_syntax_prefixes = 'html\|xml'
let xml_use_xhtml = 1

" Narrow Region Plugin
let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_nohl = 1

" EOF
