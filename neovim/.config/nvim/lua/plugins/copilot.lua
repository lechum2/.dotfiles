return {
    {
        "zbirenbaum/copilot.lua",
        cmd = { "Copilot" },
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        -- build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            temperature = 0.1, -- Lower = focused, higher = creative
            window = {
                layout = "vertical", -- 'vertical', 'horizontal', 'float'
                width = 0.5, -- 50% of screen width
            },
            auto_insert_mode = true, -- Enter insert mode when opening
            debug = false, -- Enable debugging
            trusted_tools = { "copilot", "curl", "pwsh", "python", "node", "rg", "jq" },
        },
        -- See Commands section for default commands if you want to lazy load on them
        cmd = { "CopilotChatOpen" },
    },
    {
        "yetone/avante.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        -- ⚠️ must add this setting! ! !
        build = vim.fn.has("win32") ~= 0
                and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        cmd = { "AvanteChat", "AvanteEdit" },
        version = false, -- Never set this value to "*"! Never!
        ---@module 'avante'
        ---@type avante.Config
        opts = {
            -- add any opts here
            -- this file can contain specific instructions for your project
            instructions_file = "avante.md",
            -- for example
            provider = "copilot",
            windows = {
                width = 40,
            }
        },
    },
}
