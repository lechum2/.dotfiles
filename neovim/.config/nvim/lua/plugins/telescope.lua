return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    opts = {
        defaults = {
            preview = false,
        },
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
        },
        {
            "<leader>ft",
            function()
                require("telescope.builtin").git_files()
            end,
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
        },
        {
            "<leader>fc",
            function()
                require("telescope.builtin").find_files({
                    prompt_title = "< neovim config >",
                    cwd = vim.fn.stdpath("config"),
                    hidden = true,
                })
            end,
        },
    },
}
