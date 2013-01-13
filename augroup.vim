" ----------------------------------------------------------------------------
" ~/.vim/augroup.vim (https://github.com/otaviof/vim_confs)
" ----------------------------------------------------------------------------

augroup confluencewiki
    au!
    au BufRead,BufNewFile *.cow setfiletype confluencewiki
augroup END
augroup json
    au!
    au BufRead,BufNewFile *.json setfiletype json
augroup END

augroup jvms
    au!
    au filetype {java,scala} setlocal omnifunc=javacomplete#Complete
augroup END

augroup markdown
    au!
    au filetype html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    au filetype css setlocal omnifunc=csscomplete#CompleteCSS
    au filetype xml setlocal omnifunc=xmlcomplete#CompleteTags
    au syntax mason setlocal equalprg=perltidy omnifunc=PerlComplete
    au filetype mason setlocal keywordprg=perldoc\ -T\ -f
    au syntax {xml,xhtml,html,htm,erb} runtime ftplugin/xml.vim
    au syntax *html* source ~/.vim/script/closetag.vim
augroup END

augroup javascript
    au!
    au filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

augroup perl
    au!
    au syntax perl setlocal equalprg=perltidy omnifunc=PerlComplete
    au filetype perl setlocal keywordprg=perldoc\ -T\ -f
    au filetype perl syn include @perlDATA syntax/MojoliciousTemplate.vim
augroup END

augroup python
    au!
    " au filetype python set omnifunc=pythoncomplete#Complete complete+=k~/.vim/syntax/python.vim isk+=.,(
    " au filetype python setlocal omnifunc=pysmell#Complete complete+=k~/.vim/syntax/python.vim
    au filetype python let python_highlight_all=1
    " au filetype python call NeoComplCacheDisable()
    au BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
augroup END

augroup ruby
    au!
    au filetype ruby setlocal omnifunc=rubycomplete#Complete
    au filetype ruby source ~/.vim/ftplugin/ri.vim
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
    autocmd BufWritePost ~/.vimrc    so ~/.vimrc
    autocmd BufWritePost vimrc       so ~/.vimrc
    autocmd BufWritePost gvimrc      so ~/.gvimrc
    autocmd BufWritePost augroup.vim so ~/.vim/augroup.vim
augroup END

augroup xml
    au!
    au syntax xml setlocal equalprg=xmlindent\ -i\ 2\ -l\ 78
augroup END

"
" NeoComplCache
"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" EOF
