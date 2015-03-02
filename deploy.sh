#!/bin/bash

# Refresh Public folder
rm -rf public
mkdir public
echo "gitdir: ../.git/modules/public" > public/.git
echo "blog.wada811.com" > public/CNAME

# Build the project. 
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit --amend --allow-empty-message -m ""

# Push source and build repos.
git push origin master

# Come Back
cd ..

git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit --amend --allow-empty-message -m ""

# Push source and build repos.
git push origin master