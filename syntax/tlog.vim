" Vim syntax file for generic log files
"
if exists("b:current_syntax")
	finish
endif

" Numbers
syn match lineNumber	"\<[0-9]\{4}\>"
syn match measureNumber	"-\=\d\+\.\d\+"

syn match header 		"Flow Step.*"
syn match totalRow		"Entire Job.*"

hi link lineNumber		Number
hi link measureNumber	Identifier
hi link header 			Type
hi link totalRow		Special

let b:current_syntax = "log"
