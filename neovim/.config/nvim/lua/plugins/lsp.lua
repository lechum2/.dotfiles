return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
        build = ":MasonUpdate",
    },
    {
        "b0o/schemastore.nvim",
        lazy = true,
    },
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
            { "f3fora/cmp-spell" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-path" },
            { "rafamadriz/friendly-snippets" },
            { "saadparwaiz1/cmp_luasnip" },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                }),
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "codeium" },
                    { name = "buffer", keyword_length = 3 },
                    { name = "luasnip", keyword_length = 2 },
                    {
                        name = "spell",
                        option = {
                            keep_all_entries = false,
                            enable_in_context = function()
                                return true
                            end,
                        },
                    },
                },
            })
        end,
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end)

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "apex_ls",
                    "bashls",
                    "eslint",
                    "jsonls",
                    "lua_ls",
                    "rust_analyzer",
                    "tsserver",
                    "yamlls",
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                    apex_ls = function()
                        require("lspconfig").apex_ls.setup({
                            apex_jar_path = vim.fn.stdpath("data")
                                .. "/mason/packages/apex-language-server/extension/dist/apex-jorje-lsp.jar",
                            filetypes = { "apex" },
                        })
                    end,
                    yamlls = function()
                        require("lspconfig").yamlls.setup({
                            settings = {
                                yaml = {
                                    schemaStore = {
                                        -- You must disable built-in schemaStore support if you want to use
                                        -- this plugin and its advanced options like `ignore`.
                                        enable = false,
                                        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                                        url = "",
                                    },
                                    schemas = require("schemastore").yaml.schemas({
                                        select = {
                                            "GitHub Workflow",
                                        },
                                    }),
                                    validate = { enable = true },
                                    completion = { enable = true },
                                },
                            },
                        })
                    end,
                    jsonls = function()
                        require("lspconfig").jsonls.setup({
                            settings = {
                                json = {
                                    schemas = require("schemastore").json.schemas({
                                        select = {
                                            "package.json",
                                        },
                                    }),
                                    validate = { enable = true },
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
}
