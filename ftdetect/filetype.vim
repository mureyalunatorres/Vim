" Ascii Test Pattern (.ATP)
au BufNewFile,BufRead *.atp		setf atp

" Log files (time logs)
au BufNewFile,BufRead *time.log		setf tlog
au BufNewFile,BufRead *tlog		setf tlog

" Log files (generic)
au BufNewFile,BufRead *.log		setf log

" Pandoc
au BufNewFile,BufFilePre,BufRead *.md		setf markdown.pandoc
