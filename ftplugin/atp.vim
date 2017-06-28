" This file outlines any filtype specific configurations for .ATP files
setlocal nowrap

" looks for [-01LHXV]\+ with extra spaces that occur after a right angle bracket
" (>), a space, a word, then a trailing space. This matches the atp pattern of
" <optional opcode> > <timeset> <pin data>; <comment> The pattern must also
" occur before a semicolon. This effectively selects groups of <pin data> with
" extra spaces and replaces the extra spaces with a single space
if !exists(":CompressVectors")
	" using nested substitute command is significantly faster
	command CompressVectors %s/>.*;/\=substitute(submatch(0), '\s\+', ' ', 'g')/g | noh | ''
endif

set comments=s1:/*,m:*,ex:*/,://,b:>
set fo=qor

" move to next/prev commented line
nmap <silent> <C-j> :set nohlsearch<CR> /^\/\/.*<CR> :set hlsearch<CR> :noh<CR> zz
nmap <silent> <C-k> :set nohlsearch<CR> ?^\/\/.*<CR> nn :set hlsearch<CR> :noh<CR> zz

" select block with width equal to word under cursor and 4 tall
" <Alt-v> = ö
map ö <C-V>aWh3j


