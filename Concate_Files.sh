#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 file1 file2 file3 ..."
    exit 1
fi

output="combined.txt"

> "$output"

for file in "$@"
do
    if [ -f "$file" ]; then
        echo "*** filename : $file ***" >> "$output"
        cat "$file" >> "$output"
        echo "" >> "$output"
    else
        echo "Warning: $file is not a regular file."
    fi
done

echo "All files concatenated into $output"
