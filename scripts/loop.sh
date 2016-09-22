#!/bin/bash

# this script runs a test in a loop. The
# first argument is the # of iterations.
# The remaining arguments is the command
# to run. e.g. "loop.sh 3 amake checkin"

count=$1
shift

for (( i=0; i<$count; i++ ))
do
  echo "----= [$i] =----"
  date
  set -x
  killall -9 sbx_go sbxmgrd
  $*
  set +x
  if [ $? -ne 0 ]
  then
    break
  fi
done
date
