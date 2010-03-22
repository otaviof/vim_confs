"    Copyright: Copyright (C) 2008 Peter Shangov
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               minibufexplorer.vim is provided *as is* and comes with no
"               warranty of any kind, either expressed or implied. In no
"               event will the copyright holder be liable for any damamges
"               resulting from the use of this software.
"
" Name Of File: perldoc2.vim
"  Description: View POD in colour
"   Maintainer: Petar Shangov <pshangov@yahoo.com>
"  Last Change: 2009 Aug 28
"      Version: 0.03
"        Usage: :Perldoc Module::Name

function Perldoc (pod)
	
	set shellredir:>
	let s:perldoc = system("pod2vim " . shellescape(a:pod))
	set shellredir&

	if !strlen(s:perldoc)
		echohl ErrorMsg
		echo "No documentation found for " . a:pod
		echohl None
		return	
	endif

	if !strlen(g:Perldoc_path)
		echohl ErrorMsg
		echo "Please supply value for g:Perldoc_path first!" 
		echohl None
		return
	endif

	let s:pod_name_with_hyphes = substitute(a:pod, "::", "-", "g")
	let s:file_path = g:Perldoc_path . s:pod_name_with_hyphes
	let s:file_path =  fnameescape(s:file_path)
		
	let s:file_as_list = split(s:perldoc, "\n")
	
	try
		call writefile(s:file_as_list, s:file_path)
	catch
		echohl ErrorMsg
		echo "Failed to write to file " . s:file_path
		echohl None
		return	
	endtry

	execute "silent edit " . s:file_path
	
endfunction

command! -nargs=1 Perldoc call Perldoc(<f-args>)
