#!/usr/bin/env bash
quoteJson=$(curl https://favqs.com/api/qotd -s)
quote=$(echo "$quoteJson" | jq --raw-output ".quote.body")
author=$(echo "$quoteJson" | jq --raw-output ".quote.author")
sleep 2
notify-send "$author" "$quote"
