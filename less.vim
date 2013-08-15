let leader=','
let apleader= ','
let maplocalleader=','

filetype on
filetype plugin on
filetype indent off

setf man

colorscheme blackboard

set title foldlevel=999 scrolloff=999
set columns=120 lines=50
set tw=80 ruler cursorline ls=2 nu
" set cc=0 nonu
" set transparency=5

set guifont=Monaco:h13 lsp=-3
set guioptions=egmtihvF
set guitablabel=(%N%M)\ %f

runtime! macros/less.vim

syn on

" EOF
