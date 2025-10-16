return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "saghen/blink.compat",
        -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
        version = "*",
        -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
        lazy = true,
        -- make sure to set opts so that lazy.nvim calls blink.compat's setup
        opts = {
            enable_events = true,
        },
    },
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = {
            "Exafunction/windsurf.nvim",
            "rafamadriz/friendly-snippets",
            "ribru17/blink-cmp-spell",
        },
        lazy = false,
        -- use a release tag to download pre-built binaries
        version = "*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-e: Hide menu
            -- C-k: Toggle signature help
            --
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = { preset = "default" },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
            },
            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                use_nvim_cmp_as_default = false,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },
            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = {
                    "lsp",
                    "path",
                    "buffer",
                    "codeium",
                    "html-css",
                    "spell",
                    "snippets",
                },
                per_filetype = {
                    oil = {
                        "spell",
                        "buffer",
                        "path",
                    },
                    lua = {
                        "lsp",
                        "path",
                        "buffer",
                        "codeium",
                        "lazydev",
                        "spell",
                        "snippets",
                    },
                    org = {
                        "orgmode",
                        "spell",
                        "buffer",
                    },
                },
                providers = {
                    orgmode = {
                        name = "orgmode",
                        module = "orgmode.org.autocompletion.blink",
                        fallbacks = { "buffer" },
                    },
                    codeium = {
                        name = "codeium",
                        module = "codeium.blink",
                        score_offset = 10,
                        async = true,
                    },
                    spell = {
                        name = "Spell",
                        module = "blink-cmp-spell",
                        min_keyword_length = 3,
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                    ["html-css"] = {
                        name = "html-css",
                        module = "blink.compat.source",
                    },
                },
            },
        },
        opts_extend = { "sources.default" },
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "b0o/schemastore.nvim" },
        },
        config = function()
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("rust_analyzer")
            vim.lsp.enable("bashls")
            vim.lsp.config("jsonls", {
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
            vim.lsp.enable("jsonls")
            local vue_language_server_path = io.popen("npm config get prefix"):read()
            if vim.loop.os_uname().sysname == "Linux" then
                vue_language_server_path = vue_language_server_path .. "/lib"
            end
            vue_language_server_path = vue_language_server_path .. "/node_modules/@vue/laguage-server"
            local vue_plugin = {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
                configNamespace = 'typescript',
            }
            local vtsls_config = {
                settings = {
                    vtsls = {
                        tsserver = {
                            globalPlugins = {
                                vue_plugin,
                            },
                        },
                    },
                },
                filetypes = { 'vue' },
            }
            vim.lsp.config("vtsls", vtsls_config)
            vim.lsp.enable({ "vtsls", "vue_ls" })
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("eslint")
            vim.lsp.config("yamlls", {
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
            vim.lsp.enable("yamlls")
            vim.lsp.enable("lemminx")
            vim.lsp.enable('lwc_ls')
            vim.lsp.enable('marksman')

            vim.lsp.config("apex_ls", {
                cmd = {
                    "java",
                    "-cp",
                    vim.fn.stdpath("data") .. "/apex-jorje-lsp.jar",
                    "-Ddebug.internal.errors=true",
                    "-Ddebug.semantic.errors=false",
                    "-Ddebug.completion.statistics=false",
                    "-Dlwc.typegeneration.disabled=true",
                    "apex.jorje.lsp.ApexLanguageServerLauncher"
                },
                filetypes = { "apex" },
                root_markers = { "sfdx-project.json", ".git" },
                workspace_required = true,
            })
            vim.lsp.enable("apex_ls")
        end,
    },
}
