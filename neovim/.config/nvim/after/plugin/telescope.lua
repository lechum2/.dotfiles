require("telescope").setup({
    defaults = {
        preview = false,
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ft', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local search_dotfiles = function()
	builtin.find_files({
		prompt_title = "< neovim config >",
		cwd = "~/.config/nvim/",
		hidden = true,
	})
end
vim.keymap.set('n', '<leader>fc', search_dotfiles, {})
