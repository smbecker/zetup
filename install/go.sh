#!/bin/bash


wget -c https://golang.org/dl/go1.18.1.linux-amd64.tar.gz -O - | sudo tar -xvz -C /usr/local/
sudo ln -sf /usr/local/go/bin/go /usr/local/bin/go

depInstall=$(curl https://raw.githubusercontent.com/golang/dep/master/install.sh)
sudo /bin/bash -c "export GOBIN=/usr/local/go/bin ${depInstall:9}"

mkdir -p $HOME/.go
