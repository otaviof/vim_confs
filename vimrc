" ----------------------------------------------------------------------
"   ~/.vimrc && ~/.gvimrc
"
"       Otavio Fernandes <otaviof@gmail.com>
" ----------------------------------------------------------------------

set ai
set autoread
set autowrite
set autowriteall
set confirm
set expandtab
set incsearch
set joinspaces
set nobackup
set nomodeline
set ruler
set showcmd
set showmatch
set showmode
set smartindent
set smarttab
set tildeop
set wildmenu
set wrap

set backspace=indent,eol,start
set browsedir=current
set cinoptions=(0
set columns=110
set complete+=k
set guioptions=egmLtihvF
set history=50
set lines=50
set selectmode=mouse
set shiftwidth=4
set softtabstop=4
set tabstop=4
set textwidth=78
set ts=4
set vb t_vb=
set wildignore=*.bak,*.o,*.e,*~

let maplocalleader=','

filetype on
filetype plugin on
filetype indent on

if &t_Co > 1
    syntax enable
endif

if has("gui_running") 
    colorscheme no_quarter

    set cursorline
    set invnumber
    set mousehide

    set linespace=-1                " -5
    set guifont=Menlo\ Regular:h13  " Monaco:h12
    set transparency=7

    set guitablabel=(%N%M)\ %f
    set helplang=en
    set mouse=a
    set termencoding=utf-8

    set laststatus=2
    set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
endif

" Only do this part when compiled with support for autocommands.
if has("au")

    " carregando plugin do doxygen
    au! Syntax {cpp,c,idl}
    au Syntax {cpp,c,idl} runtime syntax/doxygen.vim

    au Syntax {xml,xhtml,html,htm,erb} runtime ftplugin/xml.vim

    " opcoes para ruby
    augroup ruby
        if !exists("autocommands_ruby_loaded")
            let autocommands_ruby_loaded = 1
            au BufReadPre *.rb set shiftwidth=2 ts=2 sw=2 sts=2 nu | let IndentStyle = "ruby"
            au BufNewFile *.rb 0r ~/.vim/skeleton.rb | let IndentStyle = "ruby"
        endif
    augroup END

    " carregando o plugin de xml/html
    au FileType {xml,xhtml,html,htm,erb} runtime ftplugin/xml.vim

    " perltidy will be the default formater for perl
    au Filetype perl :set equalprg='perltidy'

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
    augroup END

    au Filetype {java,scala} setlocal omnifunc=javacomplete#Complete 

    " language definition for plain text
    let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'

    " syntax highlight for txt.vim 
    au BufRead,BufNewFile *.txt setlocal ft=txt
endif

"
" Gui Cursor
"

set guicursor=n-v-c:block-Cursor
set guicursor+=i:blinkwait575-iCursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0-Cursor

"
" Returns Current Directory
"

function! CurDir()
    let curdir = substitute( getcwd(), $HOME, "~", "g" )
    return curdir
endfunction

"
" Deleting Win/Dos CR/LF
"

fun RmCR()
    let oldLine=line('.')
    exe ":%s/\r//g"
    exe ':' . oldLine
endfun
map ,cr :call RmCR()<CR>


"
" Completing words
"

function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

" inoremap <M-/> <C-R>=Mosh_Tab_Or_Complete()<CR>
" inoremap <m-/> <C-R>=Mosh_Tab_Or_Complete()<CR>
inoremap <D-/> <C-R>=Mosh_Tab_Or_Complete()<CR>

"
" Tidy-up coding style
"

map <LocalLeader>t :call Tidy()<Cr>

function! Tidy()
    let current_line = line('.')
    if &filetype == "perl"
        let tidy = 'perltidy -pbp -ce'
    elseif &filetype == "php"
        let tidy = 'php_beautifier -s4 --filters "NewLines(after=T_COMMENT:T_DOC_COMMENT,before=if:switch)"'
    elseif &filetype == "c"
        let tidy = 'indent -orig -i4 -l78 -fca -lc78 -ts4 -br -cdw -nbad -di8 -bap'
    endif
    execute ":0,$!" . tidy
    execute ":" . current_line
endfunction

"
" Java Completion
"

inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 

"
" Perl Completion Behavior
"

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


"
" Perl function declaration
" 

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

noremap <LocalLeader>gs :call GotoSub(expand('<cword>'))<cr>

"
" Show line number
"

map <F7> :set invnumber<CR>

"
" Spell checking for pt_BR and en_US
"

map <LocalLeader>g :runtime ~/.vim/spell/<CR>:set spl=pt,en spell<CR>


" 
" Caps-Lock
"

nmap :W :w
nmap :X :x
nmap :Q :q

" 
" UTF8 conversion
"

nmap <LocalLeader>utf8 !recode -q ISO-8859-1..utf-8


"
" Shortcuts for Tabs (Command on OS X)
"

map <c-t> :tabnew<cr>
map <c-h> :tabprevious<cr>
map <c-l> :tabnext<cr>

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

"
" Perl
"

let perl_extended_vars=1
let perl_fold=1
let perl_include_POD=1
let perl_include_pod=1
let perl_no_sync_on_global_var=1
let perl_no_sync_on_sub=1
let perl_nofold_packages=1
let perl_nofold_subs=0
let perl_string_as_statement=0
let perl_sync_dist=100
let perl_want_scope_in_variables=1

let g:def_perl_comp_bfunction=1
let g:def_perl_comp_packagen=1

let g:Perl_AuthorName='Otavio Fernandes'     
let g:Perl_AuthorRef='OF'                         
let g:Perl_Company=''
let g:Perl_Email='otaviof@gmail.com'   

"
" Language Support Menus (MacVim)
"

let g:BASH_LoadMenus='no'
let g:C_LoadMenus='no'
let g:Perl_LoadMenus='no'

"
" Tag List Options
"

let Tlist_Auto_Highlight_Tag=1
let Tlist_Compact_Format=0
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Process_File_Always=1
let Tlist_Show_One_File=0
let Tlist_WinWidth=35
let tlist_perl_settings='perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD'

nnoremap <silent>  <F6> :Tlist<CR>
nnoremap <silent>  <F5> :TlistUpdate<CR>
nnoremap <silent> <tab> :bn<CR

" habilitando o plugin de xml
let b:html_mode=1
let xml_use_xhtml=1

"
" NERDTree
"

map <LocalLeader>n <ESC>:NERDTree<CR>
nnoremap <silent> <LocalLeader>f :call FindInNERDTree()<CR> 

"
" Omni Completion colors
"

hi Pmenu        ctermfg=black       ctermbg=grey    cterm=NONE
hi PmenuSel     ctermfg=darkyellow  ctermbg=black   cterm=inverse

"
" Call gvim file browser
"

noremap  <silent> <s-F8>       :silent browse confirm e<CR>
inoremap <silent> <s-F8> <ESC> :silent browse confirm e<CR>

"
" Display margin
"

map <LocalLeader>m <ESC>:match rightMargin /.\%>79v/<CR>
map <LocalLeader>M <ESC>:match rightMargin <CR>

"
" FastGit ( http://github.com/c9s/fastgit.vim )
"

let g:fastgit_default_mapping=1
let g:fastgit_default_remote='origin'
let g:fastgit_statusline='a'

"
" Delimate options
"

let delimitMate="(:),[:],{:},<:>"
let delimitMate_excluded_ft=""
let delimitMate_expand_cr="\<CR>\<CR>\<Up>"
let delimitMate_expand_space="\<Space>\<Space>\<Left>"
let delimitMate_matchpairs="(:),[:],{:},<:>"
let delimitMate_quotes="\" ' ` *"
let delimitMate_visual_leader="f"

"
" Mail.App
"

let MailApp_bundle="~/.vim/MailApp.bundle/"
let MailApp_from="Otavio Fernandes <otaviof@gmail.com>"

"
" No ShowMarks when Vim starts
"

let showmarks_enable=0

"
" Clojure
" ( http://www.assembla.com/wiki/show/clojure/Getting_Started_with_Vim )
"

let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_parem_rainbow= 1
let clj_want_gorilla = 1
let vimclojure#NailgunClient = "~/.vim/bin/ng"

" EOF
