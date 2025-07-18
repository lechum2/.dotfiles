return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = {
        theme = "hyper",
        config = {
            header = {
  "..........................                        ...........................",
      ".......................        .    .        .......................",
         ".....................       ......        ....................",
           ".......................   ......   .......................",
             "......................................................",
              ".....................................................",
              "....................................................",
              "....................................................",
              "....................................................",
                           "..........................",
                                 "..............",
                                   "..........",
                                     "......",
                                      "....",
                                       "..",
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
                    desc = " dotfiles",
                    group = "Number",
                    action = "lua require('telescope.builtin').find_files({prompt_title = '< neovim config >',cwd = vim.fn.stdpath('config'),hidden = true,})",
                    key = "d",
                },
            },
        },
    },
}
