#!/bin/bash

# Check if a path was provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

path="$1"

# Check the type of path
if [ -L "$path" ]; then
    echo "$path is a symbolic link."
elif [ -f "$path" ]; then
    echo "$path is a file."
elif [ -d "$path" ]; then
    echo "$path is a directory."
else
    echo "$path does not exist."
fi
