augroup clojure
    au!
    au Syntax clojure let vimclojure#NailgunClient="~\/.vim/bin/ng"
augroup END

augroup jvms
    au!
    au Filetype {java,scala} setlocal omnifunc=javacomplete#Complete
augroup END

augroup markup
    au!
    au Syntax {xml,xhtml,html,htm,erb} runtime ftplugin/xml.vim
    au BufRead,BufNewFile *.html setlocal omnifunc=PerlComplete equalprg=perltidy\ -pbp\ -ce
augroup END

augroup perl
    au!
    au Syntax perl setlocal omnifunc=PerlComplete equalprg=perltidy\ -pbp\ -ce
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
augroup END

augroup python
    au!
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
augroup END

augroup ruby
    au!
    if !exists("autocommands_ruby_loaded")
        let autocommands_ruby_loaded = 1
        au BufReadPre *.rb setlocal sw=2 ts=2 sw=2 sts=2 nu | let IndentStyle="ruby"
        au BufNewFile *.rb 0r ~/.vim/skeleton.rb | let IndentStyle = "ruby"
    endif
augroup END

augroup text
    au!
    au BufRead,BufNewFile *.txt setlocal ft=txt
    au BufRead,BufNewFile Makefile* setlocal noexpandtab
augroup END

augroup vim
    au!
    autocmd BufWritePost ~/.vimrc   so ~/.vimrc
    autocmd BufWritePost vimrc      so ~/.vimrc
    autocmd BufWritePost gvimrc     so ~/.gvimrc
augroup END

augroup perl
    au!
    au Syntax xml setlocal equalprg=xmlindent\ -i\ 2\ -l\ 78
augroup END
