#!/bin/bash

echo "Enter the name or pattern of the files you want to count:"
read name

count=$(find . -name "*$name*" | grep -c "$name")

size=$(find . -name "*$name*" -ls | awk '{total += $7} END {print total/(1024*1024)}')

echo "Number of files found: $count"
echo "Total size of files: $size MB"

