" File:        sessions.vim
" Version:     0.2
" Author:      Todd Boland <todd dot boland at charged software dot com>
" Description: Easy session management for gvim.
" Instructions:Put into ~/.vim/plugin/ and reload vim. Manage sessions
"              using new "Sessions" menu. You can put your existing session 
"              files in ~/.vim/sessions/ and :call DrawSessionMenu().
" History:     0.2 - Win32 support added.
"              0.1 - Initial Release.

let s:vimHome = strpart(&rtp, 0, stridx(&rtp, ','))
let s:sessionDir = s:vimHome . '/sessions'

" Create vim home if needed
if !isdirectory(s:vimHome)
	call mkdir(s:vimHome)
endif

" Create sessions directory if needed
if !isdirectory(s:sessionDir)
	call mkdir(s:sessionDir)
endif

function! SaveSession()

	" If there isn't a current session, ask for a filename
	exec v:this_session != "" ? 
		\":mks! ".escape(v:this_session,' ') : ":browse mks ".s:sessionDir."<CR>"
	call DrawSessionMenu()
endfunction

" It has it's own function to call DrawSessionMenu() afterwards
function! SaveSessionAs()
	exec "browse mks ".s:sessionDir."<CR>"
	call DrawSessionMenu()
endfunction

function! DrawSessionMenu()

	" Unset the menu
	silent! aunmenu Sessions

	" Fetch session files
	let files = split(globpath(&rtp, 'sessions/*'), '\n')
	if len(files) > 0
		for file in files
			if filereadable(file)

				" Extract filename
				let filename = substitute(file,".*\\/","","") 
				exec "55amenu Sessions.".escape(filename,". ")." :source ".escape(file," ")."<CR>"
			endif
		endfor
		exec "55amenu Sessions.-Sep1- :<CR>"
	endif

	" Build rest of menu
	exec "55amenu Sessions.Load\\ Session\\.\\.\\. :browse source ".s:sessionDir."<CR>"
	exec "55amenu Sessions.-Sep2- :<CR>"
	exec "55amenu Sessions.Save\\ Session :call SaveSession()<CR>"
	exec "55amenu Sessions.Save\\ Session\\ As\\.\\.\\. :browse mks ".s:sessionDir."<CR>"
endfunction

call DrawSessionMenu()
