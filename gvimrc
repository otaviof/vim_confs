" ----------------------------------------------------------------------------
" ~/.gvimrc
" ----------------------------------------------------------------------------

let apleader= ','
let leader=','
let localleader=","
let mapleader=","
let maplocalleader=','

source ~/.vim/set_globals.vim

if has("autocmd")
    source ~/.vim/augroup.vim
endif

if has("gui_macvim")
    set title

    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:blinkwait575-iCursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0-Cursor

    " set guifont=Monaco:h13 lsp=-3
    set guifont=Osaka-Mono:h15 lsp=-2
    " set guifont=Mensch:h14 lsp=-1
    " set guifont=Fixedsys\ True\ Type\ Font:h16 lsp=-2
    set transparency=8
    set nu
    " set guifont=Monaco\ for\ Powerline:h13 lsp=-3
    set guioptions=egmtihvF
    set guitablabel=(%N%M)\ %f

    let g:git_branch_status_head_current=1
    let g:git_branch_status_nogit=""
    let g:git_branch_status_around="[]"
    let g:git_branch_status_text=" :: "

    set cul hlg=en mh mouse=a tenc=utf-8
    " set statusline=\-\-\ \%t\ %<%=\ \(\%F\)\ [%1*%M%*%n%R%H]\ \%l/%L:%c\%{GitBranchInfoString()}\ \-\-
    set history=500 lines=53 columns=130
    set colorcolumn=+1,+2,+3,+4,+5,+6,+7,+8,+9,+10,+11,+12,+13,+14,+15,+16,+17,+18,+19,+20,+21,+22,+23,+24,+25,+26,+27,+28,+29,+30,+31,+32,+33,+34,+35,+36,+37,+38,+39,+40,+41,+42,+43,+44,+45,+46,+47

    "
    " Colorscheme options
    "

    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    let g:solarized_degrade = 0
    let g:solarized_bold = 1
    let g:solarized_underline = 0
    let g:solarized_italic = 1
    let g:solarized_contrast = "normal"
    let g:solarized_visibility = "normal"

    " let g:Powerline_colorscheme = 'zenburn'
    " set background=dark
    " colorscheme no_quarter

    let g:Powerline_colorscheme = 'solarized256'
    set background=light
    colorscheme solarized

    set invmmta

    macm File.Open\ Tab\.\.\. key=<nop>

    silent! unmenu Plugin.Git\ Info
endif

set laststatus=2

" EOF
