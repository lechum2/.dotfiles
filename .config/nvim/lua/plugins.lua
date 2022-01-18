return require('packer').startup(function()
		use 'wbthomason/packer.nvim'
	
		use {
				'nvim-treesitter/nvim-treesitter',
				run = ':TSUpdate'
		}

		use 'tpope/vim-fugitive'

		--telescope
		use 'kyazdani42/nvim-web-devicons'
		use 'nvim-lua/popup.nvim'
		use 'nvim-lua/plenary.nvim'
		use 'nvim-telescope/telescope.nvim'
		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

		--Themes
		use 'NLKNguyen/papercolor-theme'
		use 'Shatur/neovim-ayu'
end)
