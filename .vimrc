
"vim-plugin
call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()

syntax on
set number
set ruler
highlight LineNr ctermfg=DarkGray

let g:material_theme_style = 'darker'
colorscheme material
