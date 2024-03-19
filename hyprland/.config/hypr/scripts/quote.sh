#!/usr/bin/env bash
quoteJson=$(curl https://api.quotable.io/random -s)
quote=$(echo "$quoteJson" | jq --raw-output ".content")
author=$(echo "$quoteJson" | jq --raw-output ".author")
sleep 2
notify-send "$author" "$quote"
