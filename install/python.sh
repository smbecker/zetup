#!/bin/bash

sudo apt -yq install \
  libncurses5-dev \
  libncursesw5-dev \
  libx11-dev \
  libxtst-dev \
  xorg-dev \
  g++ \
  cloc

wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda3Installer.sh
bash Miniconda3Installer.sh -b
rm Miniconda3Installer.sh

if [ -f $HOME/zetup/config/.conda_bashrc ]; then
  cp $HOME/zetup/config/.conda_bashrc ~/.conda_bashrc;
fi
