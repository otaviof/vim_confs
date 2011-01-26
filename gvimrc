" ----------------------------------------------------------------------------
" ~/.gvimrc
" ----------------------------------------------------------------------------

source ~/.vim/set_globals.vim

if has("gui_macvim")
    map <D-T> :CommandT<CR>

    set title

    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:blinkwait575-iCursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0-Cursor

    set guifont=Monaco:h13 lsp=-3
    set guioptions=egmtihvF
    set guitablabel=(%N%M)\ %f

    let g:git_branch_status_head_current=1
    let g:git_branch_status_nogit=""
    let g:git_branch_status_around="[]"
    let g:git_branch_status_text=" :: "

    set cul hlg=en ls=2 mh mouse=a nu tenc=utf-8 transparency=5
    set statusline=\-\-\ \%t\ %<%=\ \(\%F\)\ [%1*%M%*%n%R%H]\ \%l/%L:%c\%{GitBranchInfoString()}\ \-\-
    set foldmethod=syntax history=50 lines=53 columns=100

    let g:BASH_LoadMenus='no'
    let g:C_LoadMenus='no'
    let g:Perl_LoadMenus='no'

    colorscheme no_quarter

    set invmmta

    macmenu File.Open\ Tab\.\.\. key=<nop>
endif

if has("autocmd")
    source ~/.vim/augroup.vim
endif

" EOF
