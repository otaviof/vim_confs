augroup clojure
    au!
    au Syntax clojure let vimclojure#NailgunClient="~\/.vim/bin/ng"
augroup END

augroup json
    au!
    au BufRead,BufNewFile *.json setfiletype json
augroup END

augroup jvms
    au!
    au filetype {java,scala} setlocal omnifunc=javacomplete#Complete
augroup END

augroup markup
    au!
    au syntax {xml,xhtml,html,htm,erb} runtime ftplugin/xml.vim
    au syntax *html* setlocal omnifunc=htmlcomplete#CompleteTag
    au syntax *html* source '~/.vim/script/closetag.vim'
augroup END

augroup perl
    au!
    au syntax perl setlocal equalprg=perltidy\ -pbp\ -ce omnifunc=PerlComplete
    au filetype perl syn include @perlDATA syntax/MojoliciousTemplate.vim
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

augroup xml
    au!
    au syntax xml setlocal equalprg=xmlindent\ -i\ 2\ -l\ 78
augroup END
