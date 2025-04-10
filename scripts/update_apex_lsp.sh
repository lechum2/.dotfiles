#!/bin/bash
path=$(nvim --headless +'lua print(vim.fn.stdpath("data"))' +qa)
wget -O `$path/apex-jorje-lsp.jar` 'https://github.com/forcedotcom/salesforcedx-vscode/blob/develop/packages/salesforcedx-vscode-apex/out/apex-jorje-lsp.jar?raw=true'
