#!/bin/bash
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list

echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

mkdir -p $HOME/Tools/bin
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.11.1/kind-$(uname)-amd64"
chmod +x ./kind
mv ./kind $HOME/Tools/bin/

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
sudo ./get_helm.sh
rm get_helm.sh

git clone https://github.com/lee0c/kubectl-watch.git
cp ./kubectl-watch/kubectl-watch $HOME/Tools/bin
rm -rf ./kubectl-watch
sudo ln -s $HOME/Tools/bin/kubectl-watch /usr/local/bin/kubectl-watch
