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
    'lewis6991/gitsigns.nvim',
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    { "ThePrimeagen/vim-be-good",   cmd = "VimBeGood" },
    { dir = "~/workspace/sfdx.nvim" },
}
