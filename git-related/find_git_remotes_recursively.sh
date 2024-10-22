#!/bin/bash

# Specify the base directory where your repositories are located
base_dir="/Users/gad.rosenthal/src"

# Function to check if a directory is a Git repository and print the origin URL
check_git_repo() {
    local repo=$1
    if [ -d "$repo/.git" ]; then
        echo "Repository: $repo"
        # Get the origin remote URL
        git -C "$repo" remote get-url origin
        echo
    fi
}

# Export function so it can be used with find
export -f check_git_repo

# Use find to traverse all subdirectories and check for Git repositories
find "$base_dir" -type d -exec bash -c 'check_git_repo "$0"' {} \;
