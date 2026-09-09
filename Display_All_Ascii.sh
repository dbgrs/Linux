#!/bin/bash

if [ $# -eq 1 ]; then
    dir="$1"
elif [ $# -eq 0 ]; then
    dir="."
else
    echo "Usage: $0 [directory]"
    exit 1
fi

if [ ! -d "$dir" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

echo "ASCII/Text files in $dir:"
echo "--------------------------"

for file in "$dir"/*
do
    if [ -f "$file" ] && file "$file" | grep -qi "text"; then
        echo "===== $file ====="
        cat "$file"
        echo
    fi
done

