return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
        defaults = {
            preview = false,
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        },
    },
    init = function()
        require("telescope").load_extension("fzf")
    end,
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find in files",
        },
        {
            "<leader>ft",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Find in git files",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Live grep in files",
        },
        {
            "<leader>fr",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            desc = "Fuzzy find in current buffer",
        },
        {
            "<leader>fj",
            function()
                require("telescope.builtin").jumplist()
            end,
            desc = "Fuzzy find in jumplist",
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Find in buffers",
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Find in help tags",
        },
        {
            "<leader>fs",
            function()
                require("telescope.builtin").spell_suggest()
            end,
            desc = "List spelling suggestions for word under cursor",
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
            desc = "Find in config files",
        },
        {
            "<leader>fn",
            function()
                require("telescope.builtin").find_files({
                    prompt_title = "< notes >",
                    cwd = "~/notes/",
                })
            end,
            desc = "Find in note files",
        },
    },
}
