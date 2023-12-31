return {
    dir = "~/workspace/sfdx.nvim",
    ft = { "apex" },
    config = function()
        local ft = require("Comment.ft")
        ft.set("apex", { "//%s", "/*%s*/" })
    end,
    keys = {
        {
            "<leader>sd",
            function()
                require("sfdx").deployCurrentFile()
            end,
        },
        {
            "<leader>stf",
            function()
                require("sfdx").runTestsFromCurrentFile()
            end,
        },
    },
}
