return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    opts = {
        show_end_of_line = true,
        space_char_blankline = " ",
    },
    init = function()
        vim.opt.list = true
        vim.opt.listchars:append("space:·")
        vim.opt.listchars:append("eol:╮")
        vim.opt.listchars:append("tab:  ¬")
    end
}
