#!/bin/bash

echo "Reading input from input.txt:"
cat < input.txt

echo "This line is written to output.txt" > output.txt

echo "This line is appended to output.txt" >> output.txt

cat nonexistent.txt 2> error.txt

echo "Output redirection completed."
echo "Error message is stored in error.txt"
