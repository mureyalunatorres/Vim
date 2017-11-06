set nocompatible

set encoding=utf-8 " displayed
set fileencoding=utf-8 " written to file
set ff=unix

" vundle stuff
if has("win32") || has('win64')
	source $HOME/vimfiles/plugin/vundle_rc.vim
else
	source ~/vim/plugin/vundle_rc.vim
endif

if has("win32") || has('win64')
	set backupdir=$HOME/Documents/workspace/vim/backup//
	set directory=$HOME/Documents/workspace/vim/swap//
	set undodir=$HOME/Documents/workspace/vim/undo//
	let g:ctrlp_root_markers = ['Notes']
	let g:gtrlp_working_path_mode = 'rc'
	"set rtp+=$HOME/vim/
	let g:UltiSnipsSnippetsDir="~/vim/customUltiSnips" "were my custom snippets are held

	" disabled directx... runs too slow
	" set renderoptions=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:5,taamode:1
endif

let g:UltiSnipsSnippetDirectories=["UltiSnips", "customUltiSnips"]
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set wildignore+=*.pdf "ignore pdfs in searches

" ui
set number
set relativenumber
set ruler
set scrolloff=10 "keeps 10 lines above/below cursor by scrolling the window
set sidescroll=1

" searching
set showmatch
set hlsearch " highlights all matches
set incsearch "searches as you type the query
set ignorecase " case insensitive search

" indentation/formatting
set tabstop=4
set shiftwidth=4
set backspace=2 " allows sensible backspace behavior
set autoindent
set textwidth=80
set formatoptions+=t "auto-wrap text using text-width
set list
set listchars=tab:>- " along with set list, displays characters to indicate a tab
set spellfile=$HOME/vim/vimfiles/spell/en.utf-8.add
set complete+=kspell

" gVim settings
if has('gui_running')
	set guioptions-=T " no toolbar
	set lines=40 columns=85
	if has("win32") || has('win64')
		set guifont=Source_Code_Pro:h11
	else
		set guifont=Source\ Code\ Pro\ 11
	endif
endif

" Theme settings
colo gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'

" Pandoc settings
let g:pandoc#modules#disabled = ["folding", "formatting"]

" vim-skeleton settings
let g:skeleton_template_dir = "~/vim/.vim/templates"

" Functions
function! ToggleSplit()
	if winwidth(2) == -1
		"there isn't a split yet
		vsplit
		normal <C-w>=
	else
		"close split
		only
	endif
endfunction


" keymappings
imap <C-BS> <C-w>
" toggle linewrapping
map <F8> :call ToggleSplit()<CR>
" toggle linewrapping
map <F9> :set wrap!<CR>
" toggle log filetype
map <F10> :set ft=log<CR>
" toggle time log filetype
map <F11> :set ft=tlog<CR>

" abbreviations
iab khz		kHz
iab mhz		MHz
iab usb		USB
iab micromips	$\mu$MIPS32
iab mips	MIPS32
iab mchp	Microchip Technology Inc.
iab adc		ADC
iab bor		BOR
iab cpu		CPU
iab jtag	JTAG
iab fpga	FPGA
iab mcu8	MCU8
iab mcu16	MCU16
iab mcu32	MCU32
iab visi	VISI


set diffopt+=iwhite

syntax on
