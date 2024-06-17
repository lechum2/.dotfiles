return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    opts = {
        tools = {
            language_server = "/data/data/com.termux/files/home/codeium_lsp_proot.sh"
        }
    }
}
