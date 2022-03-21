return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("tpope/vim-fugitive")

	--telescope
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	--LSP
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	use("sbdchd/neoformat")

	use("gpanders/editorconfig.nvim")

	use("mbbill/undotree")

	use("tpope/vim-surround")

	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

	use("~/workspace/sfdx.nvim")

	--Themes
	use("NLKNguyen/papercolor-theme")
end)
