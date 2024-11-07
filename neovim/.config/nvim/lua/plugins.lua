return {
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
    },
    "nvim-treesitter/nvim-treesitter-context",
    {
        "mbbill/undotree",
        keys = {
            {
                "<leader>u",
                vim.cmd.UndotreeToggle,
                desc = "Undotree",
            },
        },
    },
    {
        "mechatroner/rainbow_csv",
        ft = { "csv" },
    },
    {
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood"
    },
}
