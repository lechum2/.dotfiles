return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    branch = "stable",
    lazy = false,
    opts = {
        integrations = {
            icon = "nvim_web_devicons",
        },
        views = {
            finder = {
                default_explorer = true,
                win = {
                    win_opts = {
                        number = true,
                        relativenumber = true,
                        signcolumn = "yes",
                    }
                }
            },
        },
    },
    keys = {
        { "<leader>ee", "<Cmd>Fyler<Cr>", desc = "Open Fyler View" },
        { "<leader>el", "<Cmd>Fyler kind=split_left_most<Cr>", desc = "Open Fyler View" },
    }
}
