return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = {
        theme = "hyper",
        config = {
            header = {
                   "_,    _   _    ,_",
              ".o888P     Y8o8Y     Y888o.",
             "d88888      88888      88888b",
            "d888888b_  _d88888b_  _d888888b",
            "8888888888888888888888888888888",
            "8888888888888888888888888888888",
            "YJGS8P\"Y888P\"Y888P\"Y888P\"Y8888P",
             "Y888   '8'   Y8P   '8'   888Y",
              "'8o          V          o8'",
                "`                     `",
            },
            week_header = {
                enable = false,
            },
            packages = {
                enable = true,
            },
            shortcut = {
                {
                    desc = "󰊳 Update",
                    group = "@property",
                    action = "Lazy update",
                    key = "u",
                },
                {
                    icon = " ",
                    icon_hl = "@variable",
                    desc = "Files",
                    group = "Label",
                    action = "Telescope find_files",
                    key = "f",
                },
                {
                    desc = " Apps",
                    group = "DiagnosticHint",
                    action = "Telescope app",
                    key = "a",
                },
                {
                    desc = " dotfiles",
                    group = "Number",
                    action = "Telescope dotfiles",
                    key = "d",
                },
            },
        },
    },
}
