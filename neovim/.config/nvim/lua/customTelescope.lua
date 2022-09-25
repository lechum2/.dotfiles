require("telescope").setup({
	defaults = {
		preview = false,
	},
})

-- Use native fzf for performance
require("telescope").load_extension("fzf")

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.config/nvim/",
		hidden = true,
	})
end

return M
