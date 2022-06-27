lua require('myNullLsConfig')

nnoremap <leader>df <cmd>lua vim.lsp.buf.formatting()<cr>
nnoremap <leader>da <cmd>lua vim.lsp.buf.code_action()<cr>
