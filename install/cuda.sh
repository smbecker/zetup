#!/bin/bash

if [ "$(lspci | grep -i 'VGA compatible controller: NVIDIA')" != "" ]; then
  wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
  sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
  wget https://developer.download.nvidia.com/compute/cuda/11.6.2/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb
  sudo dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb
  sudo apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub
  sudo apt-get update
  sudo apt-get -y install cuda
  rm cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb
fi
