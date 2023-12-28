return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- Everything in opts will be passed to setup()
    opts = {
        notify_on_error = true,
        -- Define your formatters
        formatters_by_ft = {
            css = { "prettier" },
            html = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            lua = { "stylua" },
            markdown = { "prettier" },
            rust = { "rustfmt" },
            sh = { "shfmt" },
            typescript = { "prettier" },
            yaml = { "prettier" },
            apex = { "prettierapex" },
            xml = { "prettierxml" },
            groovy = { "npmgroovylint" },
        },
        formatters = {
            prettierapex = {
                inherit = false,
                command = "prettier",
                args = {
                    "$FILENAME",
                    "--plugin=prettier-plugin-apex",
                },
                cwd = function()
                    local prettier_global_plugin_path = io.popen("npm config get prefix"):read()
                    if vim.loop.os_uname().sysname == "Linux" then
                        prettier_global_plugin_path = prettier_global_plugin_path .. "/lib"
                    end
                    return prettier_global_plugin_path
                end,
            },
            npmgroovylint = {
                inherit = false,
                command = "npm-groovy-lint",
                args = {
                    "--format",
                    "$FILENAME",
                    "--failon none",
                },
                stdin = false,
            },
            prettierxml = {
                inherit = false,
                command = "prettier",
                args = {
                    "$FILENAME",
                    "--plugin=@prettier/plugin-xml",
                },
                cwd = function()
                    local prettier_global_plugin_path = io.popen("npm config get prefix"):read()
                    if vim.loop.os_uname().sysname == "Linux" then
                        prettier_global_plugin_path = prettier_global_plugin_path .. "/lib"
                    end
                    return prettier_global_plugin_path
                end,
            },
        },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
