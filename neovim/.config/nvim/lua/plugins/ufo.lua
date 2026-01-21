return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
            "neovim/nvim-lspconfig",
        },
        lazy = false,
        opts = {
            --set treesitter as folding provider (lsp was not working for some files like 'org')
            --leave empty opts for default setup that will use lsp(with configured capabilites) as folding provider
            provider_selector = function(bufnr, filetype, buftype)
                return {'treesitter', 'indent'}
            end
        },
        init = function()
            vim.o.foldcolumn = "0"
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
        end,
        keys = {
            {
                "zR",
                function()
                    require("ufo").openAllFolds()
                end,
            },
            {
                "zM",
                function()
                    require("ufo").closeAllFolds()
                end,
            }
        }
    }
}
