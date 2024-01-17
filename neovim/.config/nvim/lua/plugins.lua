return {
    {
        'nvim-treesitter/playground',
        cmd = "TSPlaygroundToggle",
    },
    'nvim-treesitter/nvim-treesitter-context',
    {
        'mbbill/undotree',
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle }
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "mechatroner/rainbow_csv",
        ft = { "csv" },
    },
    { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
}
