#!/bin/bash

# Add and commit each modified file one by one
git status -s | while read -r line; do
    status=$(echo "$line" | cut -c1-2)
    filename=$(echo "$line" | cut -c4-)
    
    if [ "$status" == "M " ]; then
        git add "$filename"
        git commit -m "Update $filename"
    fi
done

echo "All modified files have been added and committed."
