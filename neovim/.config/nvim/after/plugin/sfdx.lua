local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.apex = {
    install_info = {
        -- url = "https://github.com/aheber/tree-sitter-sfapex",
        url = "~/workspace/tree-sitter-sfapex/apex",
        files = {"src/parser.c"},
    },
    filetype = "apexcode",
}

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.cls", "*.trigger", "*.apex" },
    command = "set filetype=apexcode"
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.soql" },
    command = "set filetype=soql"
})

local sfdx = require("sfdx")
vim.keymap.set('n', '<leader>sd', sfdx.deployCurrentFile, {})
vim.keymap.set('n', '<leader>stf', sfdx.runTestsFromCurrentFile, {})