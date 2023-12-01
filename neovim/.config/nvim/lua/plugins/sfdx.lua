return {
    dir = "~/workspace/sfdx.nvim",
    ft = { "apex" },
    init = function()
        local sfdx = require("sfdx")
        vim.keymap.set("n", "<leader>sd", sfdx.deployCurrentFile, {})
        vim.keymap.set("n", "<leader>stf", sfdx.runTestsFromCurrentFile, {})
    end,
}
