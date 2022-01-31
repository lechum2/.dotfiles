augroup FileTypeGroup
	"au BufRead,BufNewFile *.cls,*.trigger,*.apex setlocal filetype=apex
	au BufRead,BufNewFile *.cls,*.trigger,*.apex set filetype=apex | set syntax=java
	au BufRead,BufNewFile *.soql set filetype=apex | set syntax=sql
augroup END
