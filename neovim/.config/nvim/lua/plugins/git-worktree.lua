return {
    "ThePrimeagen/git-worktree.nvim",
    lazy = true,
    opts = {
        change_directory_command = "cd",
        update_on_change = true,
        update_on_change_command = "e .",
        clearjumps_on_change = true,
        autopush = false,
    },
    init = function()
        require("telescope").load_extension("git_worktree")
    end,
    keys = {
        { "<leader>fw", function () require('telescope').extensions.git_worktree.git_worktrees() end },
        { "<leader>fc", function () require('telescope').extensions.git_worktree.create_git_worktree() end  },
    },
}