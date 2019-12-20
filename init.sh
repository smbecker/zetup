#!/bin/bash
sleep 1

if [ -z "$name" ];
then echo "What is your full name?" && read name;
else echo "Name is set to $name";
fi

if [ -z "$email" ];
then echo "What is your email?" && read email;
else echo "Email is set to $email";
fi

if [ -z "$username" ];
then echo "What is your username? Please use a consistent username with github, npm, etc."  && read username;
else echo "Username is set to $username"
fi


wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt update
sudo apt install -y git cmake apt-transport-https curl ca-certificates software-properties-common snapd

git config --global user.name "$name"
git config --global user.email "$email"
git config --global github.user "$username"
git config --global core.editor vim
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/id_rsa -N ""
fi
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
echo;

if [[ ! -z $IN_CONTAINER && $IN_CONTAINER ]]; then
  echo copy this key and paste it into your github/gitlab account
  cat ~/.ssh/id_rsa.pub
  echo https://github.com/settings/ssh/new
else
  sudo apt install -y google-chrome-stable xclip
  xdg-settings set default-web-browser google-chrome.desktop

  echo "Your github key has been copied to your clipboard. Paste it into your account in the new browser window. Please create an account if you don't already have one."
  echo
  cat ~/.ssh/id_rsa.pub | xclip -selection c
  echo
  echo
  google-chrome https://github.com/settings/ssh/new
fi

echo;
read -p  "Press enter continue: "
echo;
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

if [ ! -d $HOME/zetup ]; then
  git clone https://github.com/smbecker/zetup.git $HOME/zetup
fi

find $HOME/zetup -type f -iname "*.sh" -exec chmod +x {} \;

cd $HOME/zetup
mkdir -p ~/dev
find . -maxdepth 1 -regextype posix-egrep -regex "\.\/\..*" ! -name .git -exec cp -t .. {} +
sudo snap install yq
source setup.sh
