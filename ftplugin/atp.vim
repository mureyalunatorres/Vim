" This file outlines any filtype specific configurations for .ATP files
setlocal nowrap

" looks for [-01LHXV]\+ with extra spaces that occur after a right angle bracket
" (>), a space, a word, then a trailing space. This matches the atp pattern of
" <optional opcode> > <timeset> <pin data>; <comment> The pattern must also
" occur before a semicolon. This effectively selects groups of <pin data> with
" extra spaces and replaces the extra spaces with a single space
if !exists(":CompressVectors")
	command CompressVectors %s/\(> \w* .*\)\@<=\(;.*\)\@<!\([-01VLHX]\+\)\s\+/\3 /g | noh | '' 
endif

set comments=s1:/*,m:*,ex:*/,://,b:>
set fo=qor
