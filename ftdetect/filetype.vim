" Ascii Test Pattern (.ATP)
au BufNewFile,BufRead *.atp		setf atp

" Log files (generic)
au BufNewFile,BufRead *.log		setf log

" Pandoc
au BufNewFile,BufRead *.md		setf markdown.pandoc