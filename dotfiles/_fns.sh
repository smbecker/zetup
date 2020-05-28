#!/bin bash

upgrade_all()
{
  sudo apt update
  sudo apt upgrade
  sudo snap refresh
}

prune_branches()
{
  git remote prune origin
  git fetch
  for branch in $(git for-each-ref --format '%(refname:short)' refs/heads);
  do
    log=$(git branch --list $branch -vv)
    if [[ $log == *"gone"* ]];
    then
      git branch -D $branch
    fi
  done
}