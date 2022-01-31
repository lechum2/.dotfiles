local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

local apexCmd = {
	"/usr/bin/java",
	"-cp",
	"/opt/languageServers/apex-jorje-lsp.jar",
	"-Ddebug.internal.errors=true",
	"-Ddebug.semantic.errors=false",
	"-Ddebug.completion.statistics=false",
	"-Dlwc.typegeneration.disabled=true",
	"apex.jorje.lsp.ApexLanguageServerLauncher",
}

-- Check if it's already defined for when reloading this file.
if not configs.apexls then
	configs.apexls = {
		default_config = {
			cmd = apexCmd,
			filetypes = { "apex" },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname)
			end,
			--formatters = { exe = "prettier" },
			settings = {},
		},
	}
end
