return {
    dir = "~/workspace/sfdx.nvim",
    ft = { "apex" },
    init = function()
        local sfdx = require("sfdx")
        vim.keymap.set("n", "<leader>sd", sfdx.deployCurrentFile, {})
        vim.keymap.set("n", "<leader>stf", sfdx.runTestsFromCurrentFile, {})

        local ft = require("Comment.ft")
        ft.set("apex", { "//%s", "/*%s*/" })
    end,
}
