#!/bin/bash
wget https://raw.githubusercontent.com/forcedotcom/salesforcedx-vscode/develop/packages/salesforcedx-vscode-apex/jars/apex-jorje-lsp.jar
neovimDataFolder=$(nvim --headless +'lua print(vim.fn.stdpath("data"))' +qa 2>&1)
mv -f ./apex-jorje-lsp.jar $neovimDataFolder/apex-jorje-lsp.jar
