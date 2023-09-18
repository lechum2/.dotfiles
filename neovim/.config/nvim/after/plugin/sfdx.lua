vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.cls", "*.trigger", "*.apex" },
    command = "set filetype=apex"
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.soql" },
    command = "set filetype=soql"
})

local sfdx = require("sfdx")
vim.keymap.set('n', '<leader>sd', sfdx.deployCurrentFile, {})
vim.keymap.set('n', '<leader>stf', sfdx.runTestsFromCurrentFile, {})
