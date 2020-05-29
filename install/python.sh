#!/bin/bash

sudo apt -yq install \
  libncurses5-dev \
  libncursesw5-dev \
  libx11-dev \
  libxtst-dev \
  xorg-dev \
  g++ \
  cloc \
  python3-dev \
  python3-pip \
  jupyter-core \
  jupyter-notebook

wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda3Installer.sh
bash Miniconda3Installer.sh -b
rm Miniconda3Installer.sh

if [ -f $HOME/zetup/config/.conda_bashrc ]; then
  cp $HOME/zetup/config/.conda_bashrc ~/.conda_bashrc;
fi

#Install CUDA
if [ "$(lspci | grep -i "VGA compatible controller: NVIDIA")" != "" ]; then
  wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
  sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
  wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
  sudo dpkg -i cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
  sudo apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub
  sudo apt-get update
  sudo apt-get -y install cuda
fi