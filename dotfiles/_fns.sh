#!/bin bash

upgrade_all()
{
  sudo apt update
  sudo apt upgrade
  sudo snap refresh
}

prune_branches()
{
  git fetch
  for branch in $(git for-each-ref --format '%(refname:short)');
  do
    log=$(git branch --list $branch -vv)
    if [[ $log == *"gone"* ]];
    then
      echo -e $branch;
    fi
  done
}