#!/bin/bash

mkdir -p $HOME/Tools/bin

wget -c https://download-cf.jetbrains.com/rider/JetBrains.Rider-2020.1.3.tar.gz -O - | tar -xz -C $HOME/Tools/
mv $HOME/Tools/JetBrains\ Rider-2020.1.3/ $HOME/Tools/Rider/
chmod -R 777 $HOME/Tools/Rider/
ln -sf $HOME/Tools/Rider/bin/rider.sh $HOME/Tools/bin/rider

echo 'fs.inotify.max_user_watches = 524288' > 60-rider.conf
sudo mv 60-rider.conf /etc/sysctl.d/
sudo sysctl -p --system

sudo apt install -y libarchive-tools jq

mkdir -p $HOME/.Rider2020.1/config/plugins

# Install Cyclomatic Complexity plugin
wget -qO- https://plugins.jetbrains.com/files/$(curl https://plugins.jetbrains.com/api/plugins/10395/updates | jq -r '.[0].file') | bsdtar -xvf- -C $HOME/.Rider2020.1/config/plugins