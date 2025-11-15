#!/bin/bash


git branch feature-branch
echo "Created branch: feature-branch"

echo "Listing all branches:"
git branch

git checkout main
git merge feature-branch
echo "Merged feature-branch into main"

git checkout feature-branch
git rebase main
echo "Rebased feature-branch onto main"

git branch -d feature-branch
echo "Deleted branch: feature-branch"

touch output.txt
echo "This file is created by Job 1" > output.txt
echo "Job 1 completed successfully."
