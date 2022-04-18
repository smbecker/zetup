#!/bin/bash

sudo snap install rider --classic

echo 'fs.inotify.max_user_watches = 524288' > 60-rider.conf
sudo mv 60-rider.conf /etc/sysctl.d/
sudo sysctl -p --system

sudo apt install -y libarchive-tools jq