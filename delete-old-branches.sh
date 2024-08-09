#!/bin/bash

# Fetch the latest from remote
git fetch --all --prune

# Loop through all remote branches
git branch -r | grep -v ' -> ' | while read remote; do
  # Extract branch name
  branch=$(echo "$remote" | sed 's/origin\///')

  # Check if branch is not 'int' or 'main'
  if [[ "$branch" != "int" && "$branch" != "main" && "$branch" != "fix/localhost-issues" ]]; then
    echo "Deleting remote branch: $branch"
    git push origin --delete "$branch"
  fi
done
