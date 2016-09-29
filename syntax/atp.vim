if exists("b:current_syntax")
	finish
endif


" matches any string of 0s and 1s not after other alph-numeric strings and not
" appearing as a part of the repeat PATGEN command.
syn match binNumber		"\(repeat\s*\S*\s*\)\@<!\([XLH]\|\s\)\@<=[01]\+"
syntax match logicRead "\([01XLH]\|\s\)\@<=[XLH]"
syntax match atpComment "\/\/.*$"
syntax match atpEndComment ";.*$"
syntax region longComment start="\/\*"hs=s end="\*\/"he=e

" The default methods for highlighting.  Can be overridden later
highlight link binNumber	Number
highlight link logicRead	String
highlight link atpComment	Comment
highlight link atpEndComment	Comment
highlight link longComment		Type

let b:current_syntax = "atp"
