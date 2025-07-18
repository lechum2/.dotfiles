return {
    "xixiaofinland/sf.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/overseer.nvim",
        "ibhagwan/fzf-lua", -- no need if you don't use listing metadata feature
    },
    ft = { "apex" },
    cmd = { "SF" },
    opts = {
        -- Unless you want to customize, no need to copy-paste any of these
        -- They are applied automatically

        -- This plugin has both hotkeys and user commands supplied
        -- This flag enable/disable hotkeys while user commands are always enabled
        enable_hotkeys = false,

        -- Some hotkeys are on "project level" thus always enabled. Examples: "set default org", "fetch org info".
        -- Other hotkeys are enabled when only metadata filetypes are loaded in the current buffer. Example: "push/retrieve current metadata file"
        -- This list defines what metadata filetypes have the "other hotkeys" enabled.
        -- For example, if you want to push/retrieve css files, it needs to be added into this list.
        hotkeys_in_filetypes = {
            "apex",
            "sosl",
            "soql",
            "javascript",
            "html",
        },

        -- When Nvim is initiated, the sf org list is automatically fetched and target_org is set (if available) by `:SF org fetchList`
        -- You can set it to `false` and have a manual control
        fetch_org_list_at_nvim_start = false,

        -- Define what metadata to be listed in `list_md_to_retrieve()` (<leader>ml)
        -- Salesforce has numerous metadata types. We narrow down the scope of `list_md_to_retrieve()`.
        types_to_retrieve = {
            "ApexClass",
            "ApexTrigger",
            "StaticResource",
            "LightningComponentBundle",
        },

        terminal = "overseer",

        -- the sf project metadata folder, update this in case you diverged from the default sf folder structure
        default_dir = "/force-app/main/default/",

        -- the folder this plugin uses to store intermediate data. It's under the sf project root directory.
        plugin_folder_name = "sf_cache/",

        -- after the test running with code coverage completes, display uncovered line sign automatically.
        -- you can set it to `false`, then manually run toggle_sign command.
        auto_display_code_sign = true,

        -- code coverage sign icon colors
        code_sign_highlight = {
            covered = { fg = "#B7F071" }, -- set `fg = ""` to disable this sign icon
            uncovered = { fg = "#F07178" }, -- set `fg = ""` to disable this sign icon
        },
    },
    keys = {
        {
            "<leader>sf",
            function()
                require("sf").fetch_org_list()
            end,
            desc = "Fetch org list",
        },
        {
            "<leader>sd",
            function()
                require("sf").save_and_push()
            end,
            desc = "Deploy current file"
        },
        {
            "<leader>sr",
            function()
                require("sf").retrieve()
            end,
            desc = "Retrieve current file"
        },
        {
            "<leader>st",
            function()
                require("sf").toggle_term()
            end,
        },
        {
            "<leader>stt",
            function()
                require("sf").run_current_test_with_coverage()
            end,
            desc = "Run current test"
        },
        {
            "<leader>sta",
            function()
                require("sf").run_all_tests_in_this_file_with_coverage()
            end,
            desc = "Run all tests"
        },
        {
            "<leader>scc",
            function()
                require("sf").cancel()
            end,
            desc = "Cancel SF operation"
        },
    }
}
