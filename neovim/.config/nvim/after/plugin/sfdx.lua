local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.apexcode = "java"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.cls", "*.trigger", "*.apex" },
    command = "set filetype=apexcode | set syntax=java"
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.soql" },
    command = "set filetype=soql | set syntax=sql"
})

local sfdx = require("sfdx")
vim.keymap.set('n', '<leader>sd', sfdx.deployCurrentFile, {})
vim.keymap.set('n', '<leader>stf', sfdx.runTestsFromCurrentFile, {})
