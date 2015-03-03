#!/bin/bash

# Build the project. 
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg=""
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit --amend --allow-empty-message -m "$msg"

# Push source and build repos.
git push -f origin master

# Come Back
cd ..

git add -A

# Commit changes.
msg=""
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit --amend --allow-empty-message -m "$msg"

# Push source and build repos.
git push -f origin master