#!/bin/bash
FILE="$1"
if [ -z "$FILE" ]; then
echo "Enter filename"; exit 1
fi
if [ -f "$FILE" ]; then
echo "file"
elif [ -d "$FILE" ]; then
echo "directory"
else
echo "not found"; exit 1
fi
