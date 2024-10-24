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
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
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
