return {
    "mhartington/formatter.nvim",
    keys = {
        { "<leader>f", vim.cmd.Format },
        { "<leader>F", vim.cmd.FormatWrite },
    },
    config = function()
        -- Utilities for creating configurations
        local util = require("formatter.util")

        -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
        require("formatter").setup({
            -- Enable or disable logging
            logging = true,
            -- Set the log level
            log_level = vim.log.levels.WARN,
            -- All formatter configurations are opt-in
            filetype = {
                html = { require("formatter.filetypes.html").prettier },
                css = { require("formatter.filetypes.css").prettier },
                javascript = { require("formatter.filetypes.javascript").prettier },
                json = { require("formatter.filetypes.json").prettier },
                lua = { require("formatter.filetypes.lua").stylua },
                markdown = { require("formatter.filetypes.markdown").prettier },
                rust = { require("formatter.filetypes.rust").rustfmt },
                typescript = { require("formatter.filetypes.typescript").prettier },
                yaml = { require("formatter.filetypes.yaml").prettier },

                apexcode = {
                    function()
                        return {
                            exe = "prettier",
                            args = {
                                "--write",
                                util.escape_path(util.get_current_buffer_file_path()),
                                "--plugin=prettier-plugin-apex",
                            },
                            stdin = true,
                        }
                    end,
                },

                -- Use the special "*" filetype for defining formatter configurations on
                -- any filetype
                ["*"] = {
                    vim.lsp.buf.format,
                },
            },
        })
    end,
}
