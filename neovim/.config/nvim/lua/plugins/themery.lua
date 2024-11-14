return {
    {
        "zaldih/themery.nvim",
        lazy = false,
        opts = {
            themes = {
                "ayu-dark",
                "ayu-light",
                {
                    name = "gruvbox-dark",
                    colorscheme = "gruvbox",
                    before = [[
                    -- All this block will be executed before apply "set colorscheme"
                    vim.opt.background = "dark"
                    ]],
                },
                {
                    name = "gruvbox-light",
                    colorscheme = "gruvbox",
                    before = [[
                    vim.opt.background = "light"
                    ]],
                },
                "midnight",
                "monoglow",
                "moonbow",
            },
        },
    },
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        lazy = false,
    },
    {
        "dasupradyumna/midnight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "wnkz/monoglow.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "arturgoms/moonbow.nvim",
        lazy = false,
        priority = 1000,
    },
}
