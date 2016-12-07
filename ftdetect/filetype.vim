" Ascii Test Pattern (.ATP)
au BufNewFile,BufRead *.atp		setf atp

" Log files (generic)
au BufNewFile,BufRead *.log			setf log
au BufNewFile,BufRead *dlog*.txt	set filetype=log
au BufNewFile,BufRead *f1_prd_std*.txt	set filetype=log
au BufNewFile,BufRead *f1-prd-std*.txt	set filetype=log
au BufNewFile,BufRead *q1_prd_std*.txt	set filetype=log
au BufNewFile,BufRead *q1-prd-std*.txt	set filetype=log

" Log files (time logs)
au BufNewFile,BufRead *time.log			setf tlog
au BufNewFile,BufRead *tlog				setf tlog
au BufNewFile,BufRead *_tt*.txt			set filetype=tlog
au BufNewFile,BufRead *TT*.txt		set filetype=tlog
au BufNewFile,BufRead *testtime*.txt	set filetype=tlog

" Pandoc
au BufNewFile,BufFilePre,BufRead *.md		setf markdown.pandoc

" diff files
au BufNewFile,BufRead *diff_*.txt	set filetype=diff

