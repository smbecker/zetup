#!/bin/bash

sudo apt install -y fonts-tlwg-garuda

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
sudo ./install.sh
cd ..
rm -rf fonts
