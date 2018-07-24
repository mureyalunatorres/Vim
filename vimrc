set nocompatible

set encoding=utf-8 " displayed
set fileencoding=utf-8 " written to file
set ff=unix

" vundle stuff
if has("win32") || has('win64')
	source $HOME/vimfiles/plugin/vundle_rc.vim

	set backupdir=$HOME/Documents/workspace/vim/backup//
	set directory=$HOME/Documents/workspace/vim/swap//
	set undodir=$HOME/Documents/workspace/vim/undo//
	let g:ctrlp_root_markers = ['Notes']
	let g:ctrlp_working_path_mode = 'rc'
    
    set rtp+=$HOME/vim " add directory that contains custom snippet dirrectory
	let g:UltiSnipsSnippetsDir=$HOME."/vim/customUltiSnips" " where my custom snippets are held
else
	source ~/vim/vimfiles/plugin/vundle_rc.vim
endif

let g:UltiSnipsSnippetDirectories=["UltiSnips","customUltiSnips"]
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="horizontal"

set wildignore+=*.pdf "ignore pdfs in searches

" ui
set number
v:version > 704 ? set relativenumber
set ruler
set scrolloff=10 "keeps 10 lines above/below cursor by scrolling the window
set sidescroll=1
set sidescrolloff=15 " keeps 15 left/right of cursor by scrolling windows

" searching
set showmatch
set hlsearch " highlights all matches
set incsearch "searrches as you type the query
set ignorecase " case insensitive search

" indentation/formatting
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2 " allows sensible backspace behavior
set autoindent
set textwidth=80
set formatoptions+=t "auto-wrap text using text-width
set list
" clear listchars and display only desired
set listchars=tab:>-
set listchars+=precedes:<
set listchars+=extends:>
set spellfile=$HOME/vimfiles/spell/en.utf-8.add
set complete+=kspell

" gVim settings
if has('gui_running')
	set guioptions-=T " no toolbar
	set lines=40 columns=85
	if has("win32") || has('win64')
		set guifont=Source_Code_Pro:h11
	else
		set guifont=Source\ Code\ Pro\ 11\\,\ Monospace\ 11
	endif
endif

" Theme settings
colo gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'

function! PresentationMode()
	let &background = ( &background == "dark"? "light" : "dark" )
	let &guifont = ( &guifont == "Source_Code_Pro:h11"? "Source_Code_Pro_Semibold:h12" : "Source_Code_Pro:h11" )
endfunction

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

" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR>

augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'python'
       exec "AsyncRun! py %"
    endif
endfunction

" keymappings
imap <C-BS> <C-w>
" ctrl-s style save if buffer has been modified
map <c-s> :update<CR>
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
iab frc		FRC
iab	mem		memory
iab iglx    IG-XL
iab ttr     TTR


set diffopt+=iwhite

syntax on
