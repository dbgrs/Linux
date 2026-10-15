#!/bin/bash

read -p "Enter Directory : " DIR

read -p "Enter Filename : " FILE

echo
echo "Searching for "$FILE" in "$DIR"..."
echo 

RESULT=$(find "$DIR" -type f -name "$FILE")

if [ -n  "$RESULT" ]; then
echo "File Found:"
echo "$RESULT"
else
echo "File not found"
fi
