#!/bin/bash

# check if arg1 provided
if [ -z "$1" ]; then
    echo "Error: Must provide a File name"
    exit 1
fi 

# check arg2 provided
if [ -z "$2" ]; then
    echo "Defaulting to current dir"
fi

# create file path regardless if path provided (default to current directory if empty)
TARGETPATH="${2:-.}"   

# append a timestamp header, then the entire template to the existing file (or create it if it doesn't exist)
{
    echo ""
    echo ""
    echo "# Date: $(date +'%Y-%m-%d')"
    echo "---"
    cat nt_tmp.md
} >> "$TARGETPATH/$1.md"

# give read write to the new file
chmod 666 "$TARGETPATH/$1.md"