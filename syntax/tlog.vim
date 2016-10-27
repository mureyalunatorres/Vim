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
syn match testNum	"\<[0-9]\{4}\>"
syn match measureNumber	"-\=\d\+\.\d\+"

" opcode lines
syn match opcode		".*Opcode.*$"

" header/total rows
syn match header		"Flow Step.*$"

syn match totalNumDum	"9999" contained
syn match totalRow		"Entire Job.*$" contains=totalNumDum

hi link opcode			LineNr
hi link tests			Function
hi link t_memory		Constant
hi link t_mem_erase		Keyword
hi link testNum			LineNr
hi link measureNumber	Identifier
hi link header			Type
hi link totalNumDum		LineNr
hi link totalRow		Special

let b:current_syntax = "tlog"
