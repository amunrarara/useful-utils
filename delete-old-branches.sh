
#!/bin/bash

# This Bash script performs the following actions:

# Fetches the latest updates from all remote repositories and prunes any deleted remote branches:

# git fetch --all --prune

# Lists all remote branches and processes them one by one:

# git branch -r | grep -v ' -> ' | while read remote; do

# For each remote branch:

# Extracts the branch name by removing the "origin/" prefix:

# branch=$(echo "$remote" | sed 's/origin\///')

# Checks if the branch name is not "int" or "main":

# if [[ "$branch" != "int" && "$branch" != "main" ]]; then

# If the condition is met, it:

# a. Prints a message indicating the branch to be deleted
# b. Deletes the remote branch using the git push command:

# echo "Deleting remote branch: $branch"
# git push origin --delete "$branch"

# In summary, this script deletes all remote branches except for "int" and "main". It's essentially a cleanup script for a Git repository, removing all feature or temporary branches that might have been merged or are no longer needed.


git fetch --all --prune

git branch -r | grep -v ' -> ' | while read remote; do
  branch=$(echo "$remote" | sed 's/origin\///')
  if [[ "$branch" != "int" && "$branch" != "main" && "$branch" != "fix/localhost-issues" ]]; then
    echo "Deleting remote branch: $branch"
    git push origin --delete "$branch"
  fi
done

