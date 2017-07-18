#!/bin/bash
# Automates commit submission to github
git status
git add .
git commit -m "$1"
if [ -z "$2" ]
  then
    echo "No branch provided. Submitting to master by default."
    git push origin master
else
  git push origin $2
fi