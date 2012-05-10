" Language:		HTML-Template ( Perl Module HTML/Template.pm )
" Referencess:	Perl Module - HTML::Template v2.5
" Last Change:	26 Mar 2002 17:44:34.

if exists("b:current_syntax")
	finish
endif

runtime syntax/html.vim


" TMPL Start Tag
syn region htmltmpl
			\ start=+<\(!\z(--\)\)\=tmpl_+	end=+\z1>+
			\ containedin=ALL
			\ keepend oneline
			\ contains=htmltmpl_statement,htmltmpl_brakets

" TMPL End Tag
syn region htmltmpl
			\ start=+<\(!\z(--\)\)\=/tmpl_+	end=+\z1>+
			\ containedin=ALL
			\ keepend oneline
			\ contains=htmltmpl_loop_tagname,htmltmpl_tagname,htmltmpl_brakets


" TMPL TAG Statement START
syn match htmltmpl_statement contained +TMPL_[a-z]\++
		\ nextgroup=htmltmpl_attribute,htmltmpl_bare_attribute
		\ contains=htmltmpl_tagname,htmltmpl_loop_tagname
		\ skipwhite


" TMPL Element name Matching
syn match htmltmpl_tagname contained +TMPL_\(IF\|INCLUDE\|ELSE\|VAR\|UNLESS\)+
syn keyword htmltmpl_loop_tagname contained TMPL_LOOP


" Brakets
syn match htmltmpl_brakets contained +<\|>+


" Attribute
syn match htmltmpl_bare_attribute
			\ +[^>='"[:blank:]]\+\(\s\|>\)\@=+
			\ contained skipwhite
			\ nextgroup=htmltmpl_bare_attribute

syn region htmltmpl_attribute
			\ start=+[a-z]\+=+ end=+\s\|\(>\)\@=+
			\ contained keepend skipwhite
			\ contains=htmltmpl_attribute_name,htmltmpl_attribute_value
			\ nextgroup=htmltmpl_attribute

syn region htmltmpl_attribute
			\ start=+[a-z]\+=\z(["']\)+ end=+\z1+
			\ contained keepend skipwhite
			\ contains=htmltmpl_attribute_name,htmltmpl_attribute_value
			\ nextgroup=htmltmpl_attribute

" Hilighting
syn match htmltmpl_attribute_name contained +\(name\|escape\)\(\s*=\)\@=+

syn match htmltmpl_attribute_value contained +\(=["']\)\@<=[^"']*+	contains=htmltmpl_attribute_loop_value
syn match htmltmpl_attribute_value contained +\(=\)\@<=[^"'> ]*+	contains=htmltmpl_attribute_loop_value

syn match htmltmpl_attribute_loop_value contained
			\ +\(=["']\)\@<=__\(FIRST\|LAST\|INNER\|ODD\)__\(["']\)\@=\|\(=\)\@<=__\(FIRST\|LAST\|INNER\|ODD\)__\([[:blank:]>]\)\@=+

" ???
syn clear htmlEvent
" start=+on\a... => start=+\<on\a...
"                          ^^
if exists("html_extended_events")
	syn region htmlEvent	contained start=+\<on\a\+\s*=[\t ]*'+ end=+'+ contains=htmlEventSQ
	syn region htmlEvent	contained start=+\<on\a\+\s*=[\t ]*"+ end=+"+ contains=htmlEventDQ
else
	syn region htmlEvent	contained start=+\<on\a\+\s*=[\t ]*'+ end=+'+ keepend contains=htmlEventSQ
	syn region htmlEvent	contained start=+\<on\a\+\s*=[\t ]*"+ end=+"+ keepend contains=htmlEventDQ
endif



hi link htmltmpl_tagname				Special
hi link htmltmpl_loop_tagname			Identifier
hi link htmltmpl_brakets				Special
hi link htmltmpl_attribute_name			Type
hi link htmltmpl_attribute_value		Identifier
hi link htmltmpl_bare_attribute			Identifier
hi link htmltmpl_attribute_loop_value	Preproc


" vim: ts=4:sw=4
