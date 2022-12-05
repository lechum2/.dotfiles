" Move line in visual mode
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Move to by half screen and center
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
