return {
    {
        "zaldih/themery.nvim",
        lazy = false,
        opts = {
            themes = {
                "ayu-light",
                "dayfox",
                {
                    name = "gruvbox-light",
                    colorscheme = "gruvbox",
                    before = [[
                        vim.opt.background = "light"
                    ]],
                },
                {
                    name = "jellybeans-light",
                    colorscheme = "jellybeans-light",
                },
                {
                    name = "gruvbox-dark",
                    colorscheme = "gruvbox",
                    before = [[
                        vim.g.gruvbox_contrast_dark = "hard"
                        vim.opt.background = "dark"
                    ]],
                },
                "ayu-dark",
                "midnight",
                "monoglow",
                "moonbow",
                "nightfox",
                "terafox",
                "carbonfox",
                "darkbox",
                "gruber-darker",
                {
                    name = "jellybeans",
                    colorscheme = "jellybeans",
                },
                {
                    name = "jellybeans-muted",
                    colorscheme = "jellybeans-muted",
                },
                {
                    name = "jellybeans-mono",
                    colorscheme = "jellybeans-mono",
                },
                {
                    name = "jellybeans-warm",
                    colorscheme = "jellybeans-warm",
                },
                {
                    name = "jellybeans-hc",
                    colorscheme = "jellybeans-hc",
                },
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
    {
        "timmypidashev/darkbox.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                transparent = false, -- Disable setting background
                terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false, -- Non focused panes set to alternative background
                module_default = true, -- Default enable value for modules
                colorblind = {
                    enable = false, -- Enable colorblind support
                    simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
                    severity = {
                        protan = 0, -- Severity [0,1] for protan (red)
                        deutan = 0, -- Severity [0,1] for deutan (green)
                        tritan = 0, -- Severity [0,1] for tritan (blue)
                    },
                },
                styles = { -- Style to be applied to different syntax groups
                    comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
                    conditionals = "NONE",
                    constants = "NONE",
                    functions = "NONE",
                    keywords = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "NONE",
                    variables = "NONE",
                },
                inverse = { -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                modules = { -- List of various plugins and additional options
                    -- ...
                },
            },
            palettes = {},
            specs = {},
            groups = {},
        },
    },
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            bold = true,
            invert = {
                signs = false,
                tabline = false,
                visual = false,
            },
            italic = {
                strings = false,
                comments = true,
                operators = false,
                folds = true,
            },
            undercurl = true,
            underline = true,
        },
    },
    {
        "wtfox/jellybeans.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false,
            italics = true,
            bold = true,
            flat_ui = true, -- toggles "flat UI" for pickers
            background = {
                dark = "jellybeans", -- default dark palette
                light = "jellybeans_light", -- default light palette
            },
            plugins = {
                all = false,
                auto = true, -- auto-detect installed plugins via lazy.nvim
            },
        },
    },
}
