lua require('plugins')

syntax on

let mapleader = " "

colorscheme PaperColor

augroup FileTypeGroup
	"au BufRead,BufNewFile *.cls,*.trigger,*.apex setlocal filetype=apex
	au BufRead,BufNewFile *.cls,*.trigger,*.apex set filetype=apex | set syntax=java
	au BufRead,BufNewFile *.soql set filetype=apex | set syntax=sql
augroup END

" Move line in visual mode
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
