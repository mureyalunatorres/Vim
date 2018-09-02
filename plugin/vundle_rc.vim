filetype off
" %%%%%%%%%%%%%%%%%%%%%%%%%
" Vundle Settings
" %%%%%%%%%%%%%%%%%%%%%%%%%
if has("win32") || has('win64')
	set rtp+=$HOME/vimfiles/bundle/Vundle.vim
	call vundle#begin('$HOME/vimfiles/bundle/')
else
	set rtp+=~/.vim/bundle/Vundle.vim/
	call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'godlygeek/tabular'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-surround'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'PProvost/vim-ps1'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/paredit.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'chrisbra/vim-diff-enhanced'

call vundle#end()

filetype plugin indent on
