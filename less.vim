" ----------------------------------------------------------------------------
" ~/.vim/less.rc (github.com/otaviof/vim_confs)
" ----------------------------------------------------------------------------

let leader=','
let apleader= ','
let maplocalleader=','

filetype on
filetype plugin on
filetype indent off

setf man

colorscheme blackboard

set title foldlevel=999 scrolloff=999
set cc=0 tw=80 ruler cursorline ls=2 nu nornu
set transparency=5

set guifont=Monaco:h13 lsp=-3
set guioptions=egmtihvF
set guitablabel=(%N%M)\ %f

runtime! macros/less.vim

map <D-T> :PeepOpen<CR>

syn on

" EOF
