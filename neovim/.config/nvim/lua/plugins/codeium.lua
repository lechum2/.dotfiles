return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local opts = {};
        if vim.uv.os_uname().release:match("android") then
            opts = {
                tools = {
                    language_server = "/data/data/com.termux/files/home/codeium_lsp_proot.sh"
                }
            }
        end
        require("codeium").setup(opts);
    end
}
