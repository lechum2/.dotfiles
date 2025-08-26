#!/bin/bash
neovimDataFolder=$(nvim --headless +'lua print(vim.fn.stdpath("data"))' +qa 2>&1)
wget https://raw.githubusercontent.com/forcedotcom/salesforcedx-vscode/develop/packages/salesforcedx-vscode-apex/jars/apex-jorje-lsp.jar
wget https://github.com/redhat-developer/vscode-xml/releases/latest/download/lemminx-linux.zip

7z e lemminx-linux.zip
mv --force lemminx-linux ~/.local/bin/lemminx
rm lemminx-linux.zip

mv --force apex-jorje-lsp.jar $neovimDataFolder
