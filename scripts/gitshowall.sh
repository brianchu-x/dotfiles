#!/bin/bash
# this script looks for all commits with a particular
# string, runs "git show --name-status" on each commit.
# Useful if a project spans >1 commits, & especially so 
# if there are intervening commits by other people.

if [ "$1" = "" ]
then
  echo "Usage: $0 [search string]"
  exit 1
fi

git --no-pager log --format="tformat:%h  %Cred%ci%Creset  %<(15)%an - %s" | \
   grep -i $1 | \
   cut -d ' ' -f1 | \
   xargs git show --name-status | \
   grep -v source/
