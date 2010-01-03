" ============================================================================
" File:          MailApp.vim
" Version:       1.1
" Description:   This plugin allows Mac OS X users to send e-mails from Vim
"			     using the Mail.app application.
" Maintainer:    Israel Chauca F. <israelchauca@gmail.com>
" Documentation: Read ":help MailApp".

if exists("loaded_MailApp") && !exists("MailApp_testing")
	"call MailAppInit()
	finish
endif

let loaded_MailApp = 1

function! s:debug(msg) " {{{
	if exists("g:MailApp_debug")
		echomsg "debug: " . a:msg
	endif
endfunction " }}}
function! MailAppInit() " {{{
	let s:command_name = "mailapp"
	if !exists("g:MailApp_bundle")
		let s:mailcommand = expand('~/Documents/MailApp.bundle/') . s:command_name
	else
		if g:MailApp_bundle =~# 'MailApp/\=$'
			let s:mailcommand = simplify(substitute(g:MailApp_bundle, '/$','','') . '.bundle/' . s:command_name)
		elseif g:MailApp_bundle =~# 'MailApp.bundle/\=$'
			let s:mailcommand = simplify(g:MailApp_bundle . s:command_name)
		else
			let s:mailcommand = simplify(g:MailApp_bundle . '/MailApp.bundle/' . s:command_name)
		endif
	endif
	if !filereadable(glob(s:mailcommand))
		echoerr "MailApp: MailApp.bundle couldn't be found at '" . substitute(s:mailcommand,'\CMailApp.bundle/' . s:command_name,'','') . "', make sure it is in your 'Documents' folder or read ':help MailApp_bundle' if you placed it somewhere else."
		return 0
	endif
	let s:args = ""
	let s:from = ""
	let s:to   = ""
	let s:cc   = ""
	let s:bcc  = ""
	let s:subj = ""
	let s:att  = ""
	let s:attIsValid = 1
	let s:isBody = 0
	let s:body = ""
	set omnifunc=CompleteEmails
	if exists("g:MailApp_visible")
		let s:visible = g:MailApp_visible
	else
		let s:visible = 0
	endif
	if exists("g:MailApp_send")
		let s:send = g:MailApp_send
	else
		let s:send = 1
	endif
	return 1
endfunction " }}}

function! s:ParseText() " {{{
	for i in range(1, line('$'))
		let curLine = getline(i)
		call s:debug("curline: " . curLine)
		if s:isBody
			" Add body lines
			let s:body = s:body . curLine . "\n"
		elseif curLine =~? '^f\a*:\s*'
			" from:
			if s:from == ""
				let s:from = substitute(curLine, '\c^f\a*:\s*',"","")
			else
				" only one from header should exist.
				let s:ignored = 1
				echomsg "MailApp: More than one 'from' line #" . i . ": '" .  curLine . "'."
			endif
		elseif curLine =~? '^t\a*:\s*'
			" to:
			if s:to == ""
				let s:to = substitute(curLine, '\c^t\a*:\s*',"","")
			else
				let s:to = s:to . ';' . substitute(curLine, '\c^t\a*:\s*',"","")
			endif
		elseif curLine =~? '^c\a*:\s*'
			" cc:
			if s:cc == ""
				let s:cc = substitute(curLine, '\c^c\a*:\s*',"","")
			else
				let s:cc = s:cc . ';' . substitute(curLine, '^c\a*:\s*',"","")
			endif
		elseif curLine =~? '^b\a*:\s*'
			" bcc:
			if s:bcc == ""
				let s:bcc = substitute(curLine, '\c^b\a*:\s*',"","")
			else
				let s:bcc = s:bcc . ';' . substitute(curLine, '\c^b\a*:\s*',"","")
			endif
		elseif curLine =~? '^s\a*:\s*'
			" subject:
			if s:subj == ""
				let s:subj = substitute(curLine, '\c^s\a*:\s*',"","")
			else
				" only one subject should exist
				let s:ignored = 1
				echomsg "MailApp: More than one 'subject' line #" . i . ": '" .  curLine . "'."
			endif
		elseif curLine =~? '^a\a*:\s*'
			" attachment:
			call s:ValidateAttachment(substitute(curLine, '\c^a\a*:\s*',"",""))
		elseif len(curLine) == 0
			let s:isBody = 1
		else
				let s:ignored = 1
				echomsg "MailApp: Line #" . i . " doesn't seem to be properly formated: '" . curLine . "'."
		endif
	endfor
	if s:from == "" && exists("g:mailApp_from")
		let s:from = g:mailApp_from
	endif

endfunction " }}}

function! s:ValidateAttachment(path) " {{{
	" If the path is not absolute, convert it.
	let s:att_temp = substitute(substitute(a:path, '^\~/',glob("~/"),""), '^\([^/]\)', getcwd() . '/\1', '')
	if !filereadable(s:att_temp) || isdirectory(s:att_temp) || s:att_temp == ""
		" Can't read the file, it is a directory or the path is empty
		echomsg "MailApp: There seems to be a problem with the given path ('" . s:att_temp . "'), make sure it's valid."
		let s:attIsValid = 0
		return 0
	endif

	if s:att == ""
		let s:att = s:att_temp
	else
		" Append new attachment path
		let s:att = s:att . "\n" . s:att_temp
	endif
	return 1
endfunction " }}}

function! s:ValidateEmail() " {{{
	if s:to == ""
		" there is no 'to'
		echomsg "MailApp: You need to especify a 'To:' recipient!"
		return 0
	endif
	if s:subj == ""
		" there is no 'subject'
		let s:subjConfirm = confirm("MailApp: Subject is missing, send message anyway?", "&No\n&Yes", 1)
		if s:subjConfirm == 0 || s:subjConfirm == 1
			return 0
		endif
	endif
	if s:body == ""
		" there is no 'body'
		let s:bodyConfirm = confirm("MailApp: The message text is empty, send message anyway?", "&No\n&Yes", 1)
		if s:bodyConfirm == 0 || s:bodyConfirm == 1
			return 0
		endif
	endif
	if exists("s:ignored")
		" some line wasn't right
		return 0
	endif
	return 1
endfunction " }}}

function! MailAppExpandTab() " {{{
	let lineNumber = line('.')
	if len(getline(".")) == 0
		" complete header names sequencially
		if lineNumber == 1
			if !exists("g:mailApp_from")
				return "from: "
			else
				return "to: "
			endif
		elseif getline(lineNumber - 1) =~? '^f\a*:\(\s\|\t\)*'
			return "to: "
		elseif getline(lineNumber - 1) =~? '^t\a*:\(\s\|\t\)*'
			return "subject: "
		else
			return "\<Tab>"
		endif
	elseif strpart(getline('.'), 0, col('.')) =~? '^a\a*:\(\s\|\t\)*'
		" use file path completion
		return "\<C-X>\<C-F>"
	elseif getline('.') =~ '^\(f\|t\|c\|b\)\a*:\(\s\|\t\)*'
		" use omnicompletion
		return "\<C-X>\<C-O>"
	elseif (getline(lineNumber - 1) =~ '^\(f\|t\|s\|c\|b\|a\)\a*:\(\s\|\t\)*'
				\	|| lineNumber == 1)
				\	&& getline('.') !~ ':'
		" complete header names
		if getline('.') =~? '^f.*'
			call setline('.', "from: ")
			call setpos('.', [0, line('.'), 999, 0])
			return ""
		elseif getline('.') =~? '^t.*'
			call setline('.', "to: ")
			call setpos('.', [0, line('.'), 999, 0])
			return ""
		elseif getline('.') =~? '^s.*'
			call setline('.', "subject: ")
			call setpos('.', [0, line('.'), 999, 0])
			return ""
		elseif getline('.') =~? '^c.*'
			call setline('.', "cc: ")
			call setpos('.', [0, line('.'), 999, 0])
			return ""
		elseif getline('.') =~? '^b.*'
			call setline('.', "bcc: ")
			call setpos('.', [0, line('.'), 999, 0])
			return ""
		elseif getline('.') =~? '^a.*'
			call setline('.', "attachment: ")
			call setpos('.', [0, line('.'), 999, 0])
			return ""
		else
			return "\<Tab>"
		endif
	else
		return "\<Tab>"
	endif

endfunction " }}}

function! s:GetArguments() " {{{
	if s:from != ""
		let from = "-from " . shellescape(s:from, 1) . " "
	else
		let from = ""
	endif
	if s:to != ""
		let to   = "-to " . shellescape(s:to, 1) . " "
	else
		let to = ""
	endif
	if s:cc != ""
		let cc   = "-cc " . shellescape(s:cc, 1) . " "
	else
		let cc = ""
	endif
	if s:bcc !=""
		let bcc  = "-bcc " . shellescape(s:bcc, 1) . " "
	else
		let bcc = ""
	endif
	if s:subj != ""
		let subj = "-subject " . shellescape(s:subj, 1) . " "
	else
		let subj = ""
	endif
	if s:att != ""
		let att  = "-attachment " . shellescape(s:att, 1) . " "
	else
		let att = ""
	endif
	if s:body != ""
		let body = "-body " . shellescape(s:body, 1) . " "
	else
		let body = ""
	endif
	return from . to . cc . bcc . subj . att . body .
				\	"-send " . s:send . " -visible " . s:visible
endfunction " }}}

function! CompleteEmails(findstart, base) " {{{
	if a:findstart
		if getline('.') =~? '^f\S*:'
			" from:
			let results = match(getline('.'), substitute(getline('.'),'^\S\+:\s*','',''))
			if results == 0
				" There is no need for text to bring the list.
				let results = col('.')
			endif
		elseif getline('.') =~ ';\s*$' || getline('.') =~ '>$'
			" Nothing to complete
			let results = col('.')
		elseif getline('.') =~ ';\s*\S[^;]*$'
			" complete one more address
			let results = match(getline('.'), '\(\s*;\s*\)\@<=' . substitute(getline('.'),'^\S\+:\s*.\+;\s*','','') . "$")
		elseif getline('.') =~ '^\a\+:'
			" complete the first address
			let results = match(getline('.'),substitute(getline('.'),'\(^\S\S\{-}:\(\s\|\t\)*\)\(.*$\)','\3',""))
		endif
	else
		if getline('.') =~? '^f\S*:'
			" get list of 'from' e-mails from every account on Mail.app
			let results = split(system(s:mailcommand . " -listfrom 1"),"\n")
		elseif a:base =~ '^[[:blank:];]*$'
			" nothing to complete
			let results = ""
		else
			" get list of matching addresses from Address Book
			let results = split(system(s:mailcommand . " -list " . shellescape(a:base)),"\n")
		endif
	endif
	"echomsg "base: '" . a:base . "'"
	"echomsg s:mailcommand . " -list " . shellescape(a:base)
	return results
endfunction " }}}

function! MailAppSend() " {{{
	if  !MailAppInit()
		return 0
	endif
	call s:ParseText()
	if s:ValidateEmail() && s:attIsValid
		"echomsg "silent !" . s:mailcommand . " " . s:GetArguments()
		exec "silent !" . s:mailcommand . " " . s:GetArguments()
	else
		echomsg "MailApp: The message wasn't sent!"
	endif
endfunction " }}}

function! MailAppNew(arg) " {{{
	if a:arg
		new
	else
		vnew
	endif
	set ft=mailapp
endfunction " }}}

command! NewMailApp call MailAppNew(1)
"command! MailAppNewV call MailAppNew(0)
command! SendMailApp call MailAppSend()
autocmd BufNewFile,BufRead *.mailapp setf mailapp

" vim:foldmethod=marker:foldcolumn=2
