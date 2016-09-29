" Vim syntax file for generic log files
"
if exists("b:current_syntax")
	finish
endif

" Numbers
syn match testNumber	"^\s\d\+\D"
syn match measureNumber	"-\=\d\+\.\d\+\D"

" FAIL lines
syn match log_error		'\c.*\<\(FAIL\)\>.*'

" PASS
syn match pass			'\<PASS\>'

hi link testNumber		Number
hi link measureNumber	Identifier
hi link log_error		ErrorMsg
hi link pass			PreProc

let b:current_syntax = "log"
