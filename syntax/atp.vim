if exists("b:current_syntax")
	finish
endif

syn match binNumber	"\([XLH]\|\s\)\@<=[01]\+"
syn match iterator		"\(repeat\|set_loop[ABCD]\)\s\zs\d\+"
syn match logicRead "\([0X1VLH]\|\s\)\@<=[LVH]"
syn match logicDontCare		"\([0X1VLH]\|\s\)\@<=[X]"
syn match atpComment "\/\/.*$"
syn match atpEndComment ";.*$"
syn region longComment start="\/\*"hs=s end="\*\/"he=e

" The default methods for highlighting.  Can be overridden later
highlight link iterator		Identifier
highlight link binNumber	Number
highlight link logicRead	String
highlight link atpComment	Comment
highlight link logicDontCare	LineNr
highlight link atpEndComment	Comment
highlight link longComment		Type

let b:current_syntax = "atp"
