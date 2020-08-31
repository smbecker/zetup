# #!/bin/bash
mkdir $HOME/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install node
sudo ln -sf $(which npm) /usr/bin/npm
sudo ln -sf $(which node) /usr/bin/node

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install node

npm i -g ts-node nodemon typescript

sudo apt install watchman

sudo sysctl -w fs.file-max=65535
sudo sysctl -w fs.inotify.max_user_instances=1024
sudo sysctl -w fs.inotify.max_user_watches=524288
sudo sysctl -p
