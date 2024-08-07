#!/data/data/com.termux/files/usr/bin/bash

npm update -g

sed -i -- "s/'linux'/'android'/g" /data/data/com.termux/files/home/.local/lib/node_modules/@salesforce/cli/node_modules/@salesforce/core/lib/crypto/keyChain.js

termux-fix-shebang /data/data/com.termux/files/home/.local/bin/typescript-language-server
