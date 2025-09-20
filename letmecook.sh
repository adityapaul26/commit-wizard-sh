#!/bin/bash

# Commit Wizard (Shell version)
# A simple tool to stage, commit, and push changes in Git

# Check if inside a git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "❌ Not a Git repository. Please run inside a Git repo."
    exit 1
fi

# Ask for commit message
read -p "Enter commit message (press Enter for default): " msg

# If no message, create default with timestamp
if [ -z "$msg" ]; then
    msg="Auto commit $(date '+%Y-%m-%d %H:%M:%S')"
fi

# Stage, commit, and push
git add .
if git commit -m "$msg"; then
    if git push; then
        echo "✅ Changes pushed successfully!"
    else
        echo "⚠️ Failed to push changes."
    fi
else
    echo "⚠️ Nothing to commit."
fi

