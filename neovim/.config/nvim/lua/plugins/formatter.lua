return {
    "mhartington/formatter.nvim",
    keys = {
        { "<leader>f", vim.cmd.Format },
        { "<leader>F", vim.cmd.FormatWrite },
    },
    config = function()
        -- Utilities for creating configurations
        local util = require("formatter.util")

        local prettier_global_plugin_path = io.popen("npm config get prefix"):read()
        if vim.loop.os_uname().sysname == "Linux" then
            prettier_global_plugin_path = prettier_global_plugin_path .. "/lib"
        end

        -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
        require("formatter").setup({
            -- Enable or disable logging
            logging = true,
            -- Set the log level
            log_level = vim.log.levels.WARN,
            -- All formatter configurations are opt-in
            filetype = {
                css = { require("formatter.filetypes.css").prettier },
                html = { require("formatter.filetypes.html").prettier },
                javascript = { require("formatter.filetypes.javascript").prettier },
                json = { require("formatter.filetypes.json").prettier },
                lua = { require("formatter.filetypes.lua").stylua },
                markdown = { require("formatter.filetypes.markdown").prettier },
                rust = { require("formatter.filetypes.rust").rustfmt },
                sh = { require("formatter.filetypes.sh").shfmt },
                typescript = { require("formatter.filetypes.typescript").prettier },
                yaml = { require("formatter.filetypes.yaml").prettier },

                apexcode = {
                    function()
                        return {
                            exe = "prettier",
                            args = {
                                util.escape_path(util.get_current_buffer_file_path()),
                                "--plugin=prettier-plugin-apex",
                            },
                            cwd = prettier_global_plugin_path,
                            stdin = true,
                        }
                    end,
                },
                xml = {
                    function()
                        return {
                            exe = "prettier",
                            args = {
                                util.escape_path(util.get_current_buffer_file_path()),
                                "--plugin=@prettier/plugin-xml",
                            },
                            cwd = prettier_global_plugin_path,
                            stdin = true,
                        }
                    end,
                },
                groovy = {
                    function()
                        return {
                            exe = "npm-groovy-lint",
                            args = {
                                "--format",
                                util.escape_path(util.get_current_buffer_file_path()),
                                "--failon none",
                            },
                            stdin = false,
                        }
                    end
                },
            },
        })
    end,
}
