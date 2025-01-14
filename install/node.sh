#!/bin/bash

mkdir $HOME/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
DEBIAN_FRONTEND=noninteractive nvm install node
sudo ln -sf $(which npm) /usr/bin/npm
sudo ln -sf $(which node) /usr/bin/node

DEBIAN_FRONTEND=noninteractive corepack enable
DEBIAN_FRONTEND=noninteractive yarn set version berry

sudo apt install -y watchman

cat > 10-inotify.conf << EOL
fs.file-max=65535
fs.inotify.max_user_instances=1024
fs.inotify.max_user_watches=1048576
EOL

sudo mv 10-inotify.conf /etc/sysctl.d/10-inotify.conf
sudo sysctl -p

sudo ln -sf $(which google-chrome) /usr/local/bin/chrome
