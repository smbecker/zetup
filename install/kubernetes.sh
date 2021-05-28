#!/bin/bash
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list

echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

mkdir -p $HOME/Tools/bin
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.11.0/kind-$(uname)-amd64"
chmod +x ./kind
mv ./kind $HOME/Tools/bin/

