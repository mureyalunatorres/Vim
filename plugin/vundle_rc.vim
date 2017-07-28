filetype off
" %%%%%%%%%%%%%%%%%%%%%%%%%
" Vundle Settings
" %%%%%%%%%%%%%%%%%%%%%%%%%
if has("win32") || has('win64')
	set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
	call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
	set rtp+=~/vim/bundle/Vundle.vim/
	call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'noahfrederick/vim-skeleton'
Plugin 'godlygeek/tabular'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
"Plugin 'vim-scripts/ConvertBase'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'PProvost/vim-ps1'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/paredit.vim'
"Plugin 'kovisoft/slimv'

call vundle#end()

filetype plugin indent on
