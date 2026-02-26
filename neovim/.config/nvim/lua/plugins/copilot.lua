return {
    {
        "zbirenbaum/copilot.lua",
        cmd = { "Copilot" },
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            copilot_model = "gpt-5.2-mini",
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
            model = "gpt-5.2",
            temperature = 0.1,       -- Lower = focused, higher = creative
            window = {
                layout = "vertical", -- 'vertical', 'horizontal', 'float'
                width = 0.5,         -- 50% of screen width
            },
            auto_insert_mode = true, -- Enter insert mode when opening
            debug = false,           -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
        cmd = { "CopilotChatOpen" },
    },
}
