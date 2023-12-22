return {
    "ThePrimeagen/git-worktree.nvim",
    opts = {
        change_directory_command = "cd",
        update_on_change = true,
        update_on_change_command = "e .",
        clearjumps_on_change = true,
        autopush = false,
    },
    config = function()
        require("telescope").load_extension("git_worktree")
    end,
    keys = {
        { "<leader>ww", function () require('telescope').extensions.git_worktree.git_worktrees() end },
        { "<leader>wc", function () require('telescope').extensions.git_worktree.create_git_worktree() end  },
    },
}
