" Vim syntax file for generic log files
"
if exists("b:current_syntax")
	finish
endif

" test names
syn match tests			"\<[faltik]_\S\+" " most tests
syn match t_memory		"\<[mw]_\S\+" " memory test
syn match t_mem_erase	"\<[mw]_\S*erase\S*" " memory test

" Numbers
syn match testNumber	"^\s\d\+\s\+\d\+\s"
syn match measureNumber	"\s-\=\d\+\.\d\+\D"

" rows
syn match log_error		'\c.*\<\(FAIL\)\>.*'
syn match pass			'\<PASS\>'
syn match calib			'^\s*#.*$'

" header/footer
syn region header	start="^Datalog report$"hs=s end="Device#:.*$"he=e
syn region footer	start="^\s*Site Failed"hs=s end="^=\+$"he=e

hi link testNumber		LineNr
hi link tests			Function
hi link t_memory		Constant
hi link t_mem_erase		Keyword
hi link measureNumber	Identifier
hi link log_error		ErrorMsg
hi link pass			LineNr
hi link calib			LineNr
hi link header			Type
hi link footer			Special


let b:current_syntax = "log"
