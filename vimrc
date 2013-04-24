"
" ~/.vimrc (https://github.com/otaviof/vim_confs)
"

filetype off
set nocompatible
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set nobackup
set noswapfile
set laststatus=2

source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()
call pathogen#incubate()

let apleader= ','
let leader=','
let localleader=","
let mapleader=","
let maplocalleader=','

syntax   enable
filetype plugin on
filetype indent on
set t_Co=256

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

""" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

" map <silent> <D-E> :call ToggleVExplorer()<CR>


" ----------------------------------------------------------------------------
" -- Mappings:
" ----------------------------------------------------------------------------

" yank (copy) full path of file
nmap <leader>cp :let @" = expand("%")

" no macro recorder
nnoremap q <NOP>

" send paste (p) register to blackhole (_)
vnoremap <leader>p "_dP

" Alloy's file drawer (Textmate's alike)
" map <silent><D-E>   :macaction toggleDrawer:<CR>
" map <silent><D-M-e> :macaction selectInDrawer:<CR>

" TaskList Plugin
map <leader>j <Plug>TaskList

" Ctrl-P
let g:ctrlp_map = '<D-T>'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
set wildignore+=.git\*,.hg\*,.svn\*         " for Windows
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Perl Deparse
" nnoremap <silent> <Localleader>d :.!perl -MO=Deparse 2>/dev/null<cr>
" vnoremap <silent> <Localleader>d :!perl -MO=Deparse 2>/dev/null<cr>

" Perl tidy-up coding style
noremap <leader>t mz:%!perltidy -q<CR>'z:delmarks z<CR>

" JSON tidy-up
noremap <leader>jt mz:%!json_xs -f json -t json-pretty<CR>'z:delmarks z<CR>

" Java Completion
" inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
" inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

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
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=0
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeWinPos='right'
map <Localleader>n :execute 'NERDTreeToggle'<CR>
nnoremap <silent> <Localleader>f :call FindInNERDTree()<CR>

" TagBar
nmap <F6> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_expand = 1
let g:tagbar_width = 28
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']


" ----------------------------------------------------------------------------
" -- Plugins Options:
" ----------------------------------------------------------------------------

" Vim-OrgMode
let g:org_command_for_emacsclient='/Applications/MacPorts/Emacs.app/Contents//MacOS/bin/emacsclient'
let g:org_tags_alist='{@home(h) @work(w) @mysql(m)} {easy(e) hard(d)}'
" let g:org_todo_setup='TODO | DONE'

" Perl Options
let g:def_perl_comp_bfunction=1
let g:def_perl_comp_packagen=1

let perl_extended_vars=1
let perl_include_pod=1
let perl_nofold_packages=1
let perl_nofold_subs=0
let perl_string_as_statement=1
let perl_want_scope_in_variables=1
let perl_perltags=0

" Python Options
let python_highlight_all=1

" Tag List Options
let tlist_auto_highlight_tag=1
let tlist_compact_format=0
let tlist_ctags_cmd='/usr/bin/ctags'
let tlist_process_file_always=1
let tlist_show_one_file=0
let tlist_winwidth=35
let tlist_perl_settings='perl;u:use;p:package;r:role;e:extends;c:c+onstant;a:attribute;s:subroutine;l:label'

" Delimate options
let b:delimitMate="(:),[:],{:},<:>"
let b:delimitMate_autoclose=1
let b:delimitMate_expand_cr=1
let b:delimitMate_expand_space=1
let b:delimitMate_matchpairs="(:),[:],{:},<:>"
let b:delimitMate_quotes="\" ' `"
let b:delimitMate_visual_leader="f"
let delimitMate_nesting_quotes = ['"','`']

" NetRW options
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_fastbrowse = 2
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_retmap = 1
let g:netrw_silent = 1
let g:netrw_special_syntax = 1
let g:netrw_menu = 1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" XMLEDIT
let xml_tag_completion_map="<C-l>"
let xml_tag_syntax_prefixes='html\|xml'
let xml_use_xhtml=1

" Not loading some menus
let BASH_LoadMenus='no'
let C_LoadMenus='no'
let Perl_LoadMenus='no'

" FIXME Indent Guide
let g:indent_guides_hex_color_pattern=""

" Textile default browser
let g:TextileBrowser="Google Chrome"

" Powerline
let g:Powerline_symbols = 'fancy'
call togglebg#map("<F2>")

" Key for run python code
let g:pymode_folding = 0
let g:pymode_run = 0
let g:pymode_rope_vim_completion=1
let g:pymode_rope_extended_complete=1
let g:pymode_lint_ignore = "E501,W404,W802"


" ----------------------------------------------------------------------------
" -- neocomplcache
" ----------------------------------------------------------------------------

" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 1
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" imap <C-k> <Plug>(neocomplcache_snippets_expand)
" smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" not showing scratch preview
"   http://stackoverflow.com/questions/13611198/vim-neocomplcache-disable-usage-prompt
set completeopt-=preview

" OnSyntaxChange: disabling AutoComplPop for comments
"   http://stackoverflow.com/questions/10723499/how-to-disable-autocomplpop-completions-in-comments
call OnSyntaxChange#Install('Comment', '^Comment$', 0, 'i')
autocmd User SyntaxCommentEnterI silent! AcpLock
autocmd User SyntaxCommentLeaveI silent! AcpUnlock


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

" EOF
