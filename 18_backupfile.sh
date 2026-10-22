#!/bin/bash


if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi


SOURCE_DIR="$1"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory '$SOURCE_DIR' does not exist."
    exit 1
fi


TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")


BACKUP_FILE="backup_${TIMESTAMP}.tar.gz"


tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"


if [ $? -eq 0 ]; then
    echo "Backup created successfully: $BACKUP_FILE"
else
    echo "Error: Backup failed."
    exit 1
fi
