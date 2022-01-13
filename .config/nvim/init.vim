lua require('plugins')

syntax on
set number
set relativenumber
set tabstop=4
set smartindent
set nohlsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=100
set hidden

let mapleader = " "
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"vim-fugitive
nmap <leader>gs :G<cr>
nmap <leader>gj :diffget //3<cr>
nmap <leader>gf :diffget //2<cr>

"theme
set termguicolors
set background=dark
colorscheme PaperColor
