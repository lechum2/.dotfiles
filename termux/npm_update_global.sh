#!/data/data/com.termux/files/usr/bin/bash

npm update -g

sed -i -- "s/'linux'/'android'/g" /data/data/com.termux/files/home/.local/lib/node_modules/@salesforce/cli/node_modules/@salesforce/core/lib/crypto/keyChain.js

for file in /data/data/com.termux/files/home/.local/bin/*; do
    if [ -f "$file" ];
    then
        echo "Changing shebang in $file"
        termux-fix-shebang "$file"
    fi
done
