lua require('customTelescope')

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ search_dirs = {".", ".sfdx"} })<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>

nnoremap <leader>fc <cmd>lua require('customTelescope').search_dotfiles({ hidden = true })<cr>
