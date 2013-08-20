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
    syntax enable
    set title nu
    set transparency=11
    set guioptions=egmtihvF
    set guitablabel=(%N%M)\ %f
    set history=500 lines=53 columns=130
    set colorcolumn =+01,+02,+03,+04,+05,+06,+07,+08,+09,+10,+11,+12,+13,+14
    set colorcolumn+=+15,+16,+17,+18,+19,+20,+21,+22,+23,+24,+25,+26,+27,+28
    set colorcolumn+=+29,+30,+31,+32,+33,+34,+35,+36,+37,+38,+39,+40,+41,+42
    set colorcolumn+=+43,+44,+45,+46,+47
    set cul hlg=en mh mouse=a tenc=utf-8
    " options to make cursor blinking
    set guicursor+=i:blinkwait575-iCursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0-Cursor
    set guicursor=n-v-c:block-Cursor

    """" Setting GUI Font:
    " Line width characters example: # {} []
    "" Mensch (Powerline)
    set guifont=Mensch\ Regular\ for\ Powerline:h14 lsp=-1
    set guifontwide=Mensch\ Regular\ for\ Powerline:h14
    "" Monaco (Powerline)
    " set guifont=Monaco\ for\ Powerline:h13 lsp=-3
    " set guifontwide=Monaco\ for\ Powerline:h13
    "" Osaka Mono
    " set guifont=Osaka-Mono:h15 lsp=-2
    " set guifontwide=Osaka-Mono:h15
    "" Source Code Pro
    " set guifont=Source\ Code\ Pro\ Medium:h13 lsp=-4
    " set guifontwide=Source\ Code\ Pro\ Medium:h13
    "" Ubuntu Mono (Derivative)
    " set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15 lsp=-1
    " set guifontwide=Ubuntu\ Mono\ derivative\ Powerline:h15
    "" Ubuntu Mono (Powerline)
    " set guifont=Ubuntu\ Mono\ for\ Powerline:h14 lsp=-1
    " set guifontwide=Ubuntu\ Mono\ for\ Powerline:h14

    """" Colorscheme options:
    "" Background Type
    " set background=dark
    set background=light
    "
    "" Solarized
    let g:solarized_degrade = 0
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    let g:solarized_bold = 1
    let g:solarized_underline = 1
    let g:solarized_italic = 1
    let g:solarized_contrast = 'normal'
    let g:solarized_visibility = 'normal'
    let g:airline_theme = 'solarized'
    colorscheme solarized
    "
    "" Plum
    " let g:airline_theme = 'light'
    " let g:airline_theme = 'molokai'
    " let g:airline_theme = 'tomorrow'
    " colorscheme plum
    "
    "" No Quarter
    " colorscheme no_quarter
    " let g:airline_theme = 'badwolf'

    " a bit of help to cursor colors
    hi Cursor     gui=none guifg=fg   guibg=orangered1
    hi CursorIM   gui=none guifg=NONE guibg=#8800ff
    hi CursorLine gui=none guifg=NONE
    hi iCursor    gui=none guifg=fg   guibg=green

    set invmmta
    macm File.Open\ Tab\.\.\. key=<nop>
    silent! unmenu Plugin.Git\ Info
endif

" EOF
