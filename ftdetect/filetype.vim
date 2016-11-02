" Ascii Test Pattern (.ATP)
au BufNewFile,BufRead *.atp		setf atp

" Log files (time logs)
au BufNewFile,BufRead *time.log			setf tlog
au BufNewFile,BufRead *tlog				setf tlog
au BufNewFile,BufRead *_tt*.txt			set filetype=tlog
au BufNewFile,BufRead *TTime*.txt		set filetype=tlog
au BufNewFile,BufRead *testtime*.txt	set filetype=tlog

" Log files (generic)
au BufNewFile,BufRead *.log			setf log
au BufNewFile,BufRead *dlog*.txt	set filetype=log

" Pandoc
au BufNewFile,BufFilePre,BufRead *.md		setf markdown.pandoc


