return {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm" },
    keys = {
        { "<leader>tt", "<cmd>ToggleTerm<cr>" },
        { "<leader>tl", "<cmd>ToggleTermSendCurrentLine<cr>" },
        { "<leader>ts", "<cmd>ToggleTermSendVisualSelection<cr>", mode = "v" },
        { "<C-k>", "<cmd>wincmd k<cr>", mode = "t" },
        { "<esc>", "<C-\\><C-n>", mode = "t" },
    },
    opts = {
        size = 8
    },
}
