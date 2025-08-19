#!/bin/bash

traverse_dir() {
    local dir="$1"
    # display all the contents
    echo "contents of $dir:"
    ls -la "$dir"
    echo "----------------------------------------"

    for item in "$dir"/*; do
        if [ -d "$item" ]; then
            # to avoid infinite recursion with special directories
            if [ "$item" != "$dir/." ] && [ "$item" != "$dir/.." ]; then
                traverse_dir "$item"
            fi
        fi
    done
}

traverse_dir "/"
