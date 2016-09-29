filetype off
" %%%%%%%%%%%%%%%%%%%%%%%%%
" Vundle Settings
" %%%%%%%%%%%%%%%%%%%%%%%%%
if has("win32") || has('win64')
	set rtp+=$HOME/vim/vimfiles/bundle/Vundle.vim/
	call vundle#begin('$USERPROFILE/vim/vimfiles/bundle/')
else
	set rtp+=~/vim/bundle/Vundle.vim/
	call vundle#begin()
endif

Plugin 'godlygeek/tabular'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ConvertBase.vim'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()

filetype plugin indent on
