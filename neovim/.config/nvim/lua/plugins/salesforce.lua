return {
    "jonathanmorris180/salesforce.nvim",
    ft = { "apex" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local ft = require("Comment.ft")
        ft.set("apex", { "//%s", "/*%s*/" })
    end,
    opts = {
        debug = {
            to_file = false,
            to_command_line = false,
        },
        popup = {
            -- The width of the popup window.
            width = 100,
            -- The height of the popup window.
            height = 20,
            -- The border characters to use for the popup window
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        file_manager = {
            ignore_conflicts = true,
        },
        org_manager = {
            default_org_indicator = "󰄬",
        },
    },
    keys = {
        { "<leader>sd", "<cmd>SalesforcePushToOrg<cr>" },
        { "<leader>stf", "<cmd>SalesforceExecuteCurrentClass<cr>" },
    },
}
