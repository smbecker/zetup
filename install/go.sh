#!/bin/bash
wget -c https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz -O - | sudo tar -xvz -C /usr/local/
sudo ln -sf /usr/local/go/bin/go /usr/local/bin/go

depInstall=$(curl https://raw.githubusercontent.com/golang/dep/master/install.sh)
sudo /bin/bash -c "export GOBIN=/usr/local/go/bin ${depInstall:9}"
