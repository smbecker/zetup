# #!/bin/bash
NVM_VERSION="v12.16.3"
mkdir $HOME/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install node
sudo ln -sf $(which npm) /usr/bin/npm
sudo ln -sf $(which node) /usr/bin/node

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install "$NVM_VERSION"

npm i -g ts-node nodemon typescript
