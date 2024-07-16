#!/bin/bash

#Don't forget to use linux, me ubuntu
twitter_token="f02f6c2845b49f7a1584fa0b77b3d8cba81a764f"

#Custom your own queries
queries=(
    "penanganan stunting since:2023-11-06 until:2023-11-10"
    "penanganan stunting since:2023-11-11 until:2023-11-16"
    "penanganan stunting since:2023-11-11 until:2023-11-16"
)

for query in "${queries[@]}"; do
    npx tweet-harvest@latest --token "$twitter_token" -s "$query" --limit 200
done

#this will keep scrolling even if the tweets no more found, sleep or nap while waiting

penanganan stunting since:2023-11-06 until:2023-11-10