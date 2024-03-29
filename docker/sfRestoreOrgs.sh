#!/bin/bash
for file in /home/lechu/sfAuthFiles/*; do
    filename=$(basename -- "$file")
    sf org login sfdx-url --sfdx-url-file "$file" --alias "$filename"
done

rm -rf /home/lechu/sfAuthFiles