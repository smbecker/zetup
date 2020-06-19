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

export_proxy()
{
  export http_proxy=http://localhost:8888/
  export https_proxy=http://localhost:8888/
}

clear_proxy()
{
  export http_proxy=
  export https_proxy=
}

open_proxy()
{
  export_proxy
  mkdir -p ~/.mitmproxy/session
  google-chrome --new-window --incognito --app=http://localhost:8889/ --proxy-server="localhost:8888" --user-data-dir=~/.mitmproxy/session > /dev/null 2>&1 &
}

start_proxy()
{
  if ! pgrep -x mitmweb >/dev/null ; then
    mitmweb --listen-port 8888 --web-port 8889 --ssl-insecure > /dev/null 2>&1 &
  fi

  open_proxy
}

stop_proxy()
{
  pkill -u $UID mitmweb > /dev/null 2>&1 &
  clear_proxy
}