return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    opts = {
        exclude = {
            filetypes = {
                "",
                "TelescopePrompt",
                "TelescopeResults",
                "checkhealth",
                "dashboard",
                "gitcommit",
                "help",
                "lazy",
                "lspinfo",
                "man",
                "packer",
            },
            buftypes = {
                "nofile",
                "prompt",
                "quickfix",
                "terminal",
            },
        },
    },
    init = function()
        vim.opt.list = true
        vim.opt.listchars:append("space:⋅")
        vim.opt.listchars:append("eol:↴")
        vim.opt.listchars:append("tab:  ⇥")
    end,
}
