return {
{
    "zbirenbaum/copilot.lua",
    cmd = { "Copilot" },
    event = "InsertEnter",
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
    }
},
{
    "zbirenbaum/copilot-cmp",
    config = true,
    dependencies = {
        { "zbirenbaum/copilot.lua" }
    }
},
}
