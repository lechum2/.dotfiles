#!/bin/bash
for file in /home/lechu/sfAuthFiles/*; do
    sf org login sfdx-url --sfdx-url-file "$file" --alias $(basename $file .json)
done

rm -rf /home/lechu/sfAuthFiles
