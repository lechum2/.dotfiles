#!/bin/bash
path=$(nvim --headless +'lua print(vim.fn.stdpath("data"))' +qa)
echo "$path/apex-jorje-lsp.jar"
wget -O "$path/apex-jorje-lsp.jar" https://raw.githubusercontent.com/forcedotcom/salesforcedx-vscode/develop/packages/salesforcedx-vscode-apex/jars/apex-jorje-lsp.jar
