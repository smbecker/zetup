#!/bin/bash

sudo snap install rider --classic

echo 'fs.inotify.max_user_watches = 524288' > 60-rider.conf
sudo mv 60-rider.conf /etc/sysctl.d/
sudo sysctl -p --system

sudo apt install -y libarchive-tools jq

mkdir -p $HOME/.Rider2020.1/config/plugins

# Install Cyclomatic Complexity plugin
wget -qO- https://plugins.jetbrains.com/files/$(curl https://plugins.jetbrains.com/api/plugins/10395/updates | jq -r '.[0].file') | bsdtar -xvf- -C $HOME/.Rider2020.1/config/plugins