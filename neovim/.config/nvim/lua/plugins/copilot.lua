return {
    {
        "zbirenbaum/copilot.lua",
        cmd = { "Copilot" },
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        }
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        -- build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            debug = false, -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
        cmd = { "CopilotChatOpen" },
    },
    enabled = false,
}
