#!/bin/bash
# this script looks for all commits with a particular
# string and generates a single diff for all of those
# commits. Specifically, it only does a diff for the
# files that have changed by those commits, hopefully
# ignoring changes by intervening commits. As such it
# is not perfect but is a reasonable approximation.

if [ "$1" = "" ]
then
  echo "Usage: $0 [search string]"
  exit 1
fi

last=$(git --no-pager log --format="tformat:%h  %Cred%ci%Creset  %<(15)%an - %s" | \
          grep $1 | \
          head -n 1 | \
          cut -d ' ' -f1)

first=$(git --no-pager log --format="tformat:%h  %Cred%ci%Creset  %<(15)%an - %s" | \
          grep $1 | \
          tail -n 1 | \
          cut -d ' ' -f1)


git --no-pager log --format="tformat:%h  %Cred%ci%Creset  %<(15)%an - %s" | \
   grep $1 | \
   cut -d ' ' -f1 | \
   xargs git --no-pager show --name-status | \
   grep source/ | \
   awk '{ print $2 }' | \
   sort | \
   uniq | \
   xargs git --no-pager diff --ignore-space-at-eol -b -w $first^ $last --
