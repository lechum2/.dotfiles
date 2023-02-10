local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim', version = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/playground',

    'mbbill/undotree',

    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',

    "gpanders/editorconfig.nvim",

    "numToStr/Comment.nvim",

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
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

    "lukas-reineke/indent-blankline.nvim",

    "ThePrimeagen/vim-be-good",

    { dir = "~/workspace/sfdx.nvim" },

    --Themes
    "marko-cerovac/material.nvim",
    "Shatur/neovim-ayu",
})
