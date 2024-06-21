return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        if vim.uv.os_uname().release:match("android") then
            require("codeium").setup({
                tools = {
                    language_server = "/data/data/com.termux/files/home/codeium_lsp_proot.sh"
                }
            })
        end
    end
}
