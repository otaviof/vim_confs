" ----------------------------------------------------------------------------
" ~/.vimrc
" ----------------------------------------------------------------------------

if has("gui_macvim")
    macmenu File.Open\ Tab\.\.\. key=<nop>

    map <D-T> :CommandT<CR>

    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:blinkwait575-iCursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0-Cursor

    set guifont=Menlo\ Regular:h13
    set guioptions=egmtihvF
    set guitablabel=(%N%M)\ %f

    set cul hlg=en ls=2 lsp=-1 mh mouse=a nu tenc=utf-8 transparency=5
    set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c\ \ \ \%{GitBranchInfoString()}
    set foldmethod=syntax history=50 lines=53 columns=100

    let g:BASH_LoadMenus='no'
    let g:C_LoadMenus='no'
    let g:Perl_LoadMenus='no'

    colorscheme no_quarter
endif
