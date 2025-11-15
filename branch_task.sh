#!/bin/bash

# Create a branch
git branch feature-branch
echo "Created branch: feature-branch"

# List all branches
echo "Listing all branches:"
git branch

# Merge one branch into another
git checkout main
git merge feature-branch
echo "Merged feature-branch into main"

# Rebase one branch with another
git checkout feature-branch
git rebase main
echo "Rebased feature-branch onto main"

# Delete a branch
git branch -d feature-branch
echo "Deleted branch: feature-branch"
