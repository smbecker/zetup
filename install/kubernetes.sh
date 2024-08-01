#!/bin/bash

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list

sudo apt update
sudo apt install -y kubectl

# Install kind
mkdir -p $HOME/Tools/bin
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.23.0/kind-$(uname)-amd64"
chmod +x ./kind
mv ./kind $HOME/Tools/bin/

# Install k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
sudo ./get_helm.sh
rm get_helm.sh

# Install nvidia-container-runtime
if [ "$(lspci | grep -i nvidia)" != "" ]; then
  sudo nvidia-ctk runtime configure --runtime=containerd
  sudo systemctl restart containerd
fi