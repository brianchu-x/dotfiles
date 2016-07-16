#!/bin/bash
# this script looks for all commits with a particular
# string, runs "git show" on each commit & pipes each
# diff to a file in the /tmp directory. Useful if a
# project spans multiple commits, & especially so if
# there are intervening commits by other people.

if [ "$1" = "" ]
then
  echo "Usage: $0 [search string]"
  exit 1
fi

counter=0;
git --no-pager log --format="tformat:%h  %Cred%ci%Creset  %<(15)%an - %s" | \
   grep -i $1 | \
   cut -d ' ' -f1 | \
while read hash
do
   git show $hash > /tmp/$1.$counter.diff
   counter=$((counter+1))
done
