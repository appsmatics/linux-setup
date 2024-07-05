#!/bin/bash

echo "Removing node_modules in $PWD"

read -p "Are you sure [y/n]? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo
  echo "removing node_modules"
  find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
  echo
else
  echo
  echo "Listing node_modules in $PWD"
  find . -name "node_modules" -type d -prune | xargs du -chs
  echo
fi


