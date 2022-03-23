lua <<EOF
local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.apex = "java"
EOF

augroup FileTypeGroup
	"au BufRead,BufNewFile *.cls,*.trigger,*.apex setlocal filetype=apex
	au BufRead,BufNewFile *.cls,*.trigger,*.apex set filetype=apex | set syntax=java
	au BufRead,BufNewFile *.soql set filetype=apex | set syntax=sql
augroup END

nnoremap <leader>sd <cmd>lua require('sfdx').deployCurrentFile()<cr>
nnoremap <leader>stf <cmd>lua require('sfdx').runTestsFromCurrentFile()<cr>
nnoremap <leader>sr <cmd>lua require('plenary.reload').reload_module'sfdx'<cr>
