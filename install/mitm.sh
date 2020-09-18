#!/bin/bash

mkdir -p $HOME/Tools/bin
wget -c https://snapshots.mitmproxy.org/5.1.1/mitmproxy-5.1.1-linux.tar.gz -O - | tar -xz -C $HOME/Tools/bin

if ! [ -d "$HOME/.mitmproxy" ] ; then
  echo "Launching mitmweb in order to generate certificates"
  $HOME/Tools/bin/mitmweb --listen-port 8888 &

  echo "Waiting mitmweb to launch on 8888..."
  while ! nc -z localhost 8888; do
    sleep 0.2
  done

  sleep 1
  pkill -u $UID mitmweb
fi

if [ -d "$HOME/.mitmproxy" ] ; then
  sudo mkdir -p /usr/local/share/ca-certificates/

  for certfile in $HOME/.mitmproxy/*.pem ;
  do
    crtfile=$HOME/.mitmproxy/$(basename -- "$certfile" .pem).crt
    echo "Exporting $certfile to $crtfile"
    openssl x509 -in $certfile -inform PEM -out $crtfile
  done

  sudo cp $HOME/.mitmproxy/*.crt /usr/local/share/ca-certificates/
  sudo update-ca-certificates
fi
