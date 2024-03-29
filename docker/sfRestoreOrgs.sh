#!/bin/bash
for file in /home/lechu/sfAuthFiles/*; do
    sf org login sfdx-url --sfdx-url-file "$file"
done

rm -rf /home/lechu/sfAuthFiles