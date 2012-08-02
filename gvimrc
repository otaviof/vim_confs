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
    set guifont=Monaco\ for\ Powerline:h13 lsp=-3
    set guioptions=egmtihvF
    set guitablabel=(%N%M)\ %f

    let g:git_branch_status_head_current=1
    let g:git_branch_status_nogit=""
    let g:git_branch_status_around="[]"
    let g:git_branch_status_text=" :: "

    set cul hlg=en ls=2 mh mouse=a nu tenc=utf-8 transparency=10
    set statusline=\-\-\ \%t\ %<%=\ \(\%F\)\ [%1*%M%*%n%R%H]\ \%l/%L:%c\%{GitBranchInfoString()}\ \-\-
    set history=50 lines=53 columns=125
    set colorcolumn=+1,+2,+3,+4,+5,+6,+7,+8,+9,+10,+11,+12,+13,+14,+15,+16,+17,+18,+19,+20,+21,+22,+23,+24,+25,+26,+27,+28,+29,+30,+31,+32,+33,+34,+35,+36,+37,+38,+39,+40,+41,+42,+43,+44,+45,+46,+47

    " colorscheme no_quarter
    " set background=light
    colorscheme solarized

    set invmmta

    macm File.Open\ Tab\.\.\. key=<nop>

    silent! unmenu Plugin.Git\ Info
endif

" EOF
