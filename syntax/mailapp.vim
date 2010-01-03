
" Vim syntax file
" Language:     MailApp
" Maintainer:   Israel Chauca F. <israelchauca@gmail.com>
"

if version < 600
	syn clear
elseif exists("b:current_syntax")
	finish
endif

syn case ignore
syntax sync fromstart

" Headers
syn match mailAppHeaders '\%^\(^\a\+:.*\n\=\)*' contains=mailAppHeaderStart,mailAppAddresses,mailAppSubject,mailAppSubjectContent,mailAppAttachment

" Headers with addresses
syn match mailAppAddresses '\c^\(f\|t\|c\|b\)\a*:.*$' contains=mailAppHeaderStart,mailAppEmailLocal,mailAppEmailDomain,mailAppEmailAt,mailAppEmailDelimiter transparent

" e-mail, local part
syn match mailAppEmailLocal '\(\([^<>()[\]\\.,;:[:blank:]@"]\+\(\.[^<>()[\]\\.,;:[:blank:]@"]\+\)*\)\|\(".\+"\)\)@\@=' contained

" e-mail, domain part
syn match mailAppEmailDomain '@\@<=\(\[\(2\([0-4]\d\|5[0-5]\)\|1\=\d\{1,2}\)\(\.\(2\([0-4]\d\|5[0-5]\)\|1\=\d\{1,2}\)\)\{3} \]\)\|\(\([a-zA-Z\-0-9]\+\.\)\+[a-zA-Z]\{2,}\)' contained

" e-mail, @
syn match mailAppEmailAt '@' contained

" e-mail delimiters
syn match mailAppEmailDelimiter '[<>]' contained

" Subject
syn match mailAppSubject '\c^s\a*:.*$' contains=mailAppSubjectContent,mailAppHeaderStart transparent

" Subject content
syn match mailAppSubjectContent '\s\+.\+$' contained

" Attachment
syn match mailAppAttachment '\c^a\a*:.*$' contains=mailAppAttachmentPath,mailAppHeaderStart transparent

" Attachment path
syn match mailAppAttachmentPath '\(^\a\+:\s*\)\@<=.\+$' contained

" Header Start
syn match mailAppHeaderStart '\c^\(t\|f\|c\|b\|s\|a\)\a*:' contained

" Body
syn match mailAppBody '\(^\n\)\(^.*\n\)*\_$'

hi def link mailAppHeaderStart Statement
"hi def link mailAppHeaders Boolean
"hi def link mailAppBody String
hi def link mailAppSubjectContent Boolean
hi def link mailAppEmailAt String
hi def link mailAppEmailLocal Special
hi def link mailAppEmailDomain Special
hi def link mailAppAttachmentPath Float
hi def link mailAppEmailDelimiter Delimiter

let b:current_syntax = "mailapp"
