return {
    {
        'nvim-treesitter/playground',
        cmd = "TSPlaygroundToggle",
    },
    {
        'mbbill/undotree',
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle }
        }
    },
    'lewis6991/gitsigns.nvim',
    "numToStr/Comment.nvim",
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },


    "ThePrimeagen/vim-be-good",
    { dir = "~/workspace/sfdx.nvim" },
}
