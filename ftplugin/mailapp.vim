if exists("b:did_ftplugin")
	finish
endif
	if  !MailAppInit()
		finish
	endif
"setlocal omnifunc=CompleteEmails
imap <buffer> <expr> <Tab> "\<C-R>=MailAppExpandTab()\<CR>"
"noremap <buffer> <leader>send :call MailAppSend()<CR>
let b:did_ftplugin = 1
