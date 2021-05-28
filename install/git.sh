#!/bin/bash

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Setup LFS support and GitHub CLI
sudo apt-add-repository -y ppa:git-core/ppa
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository -y https://cli.github.com/packages
sudo apt update
sudo apt install -y git-lfs gh
git lfs install

# Setup difftool and mergetool
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-merge

git config --global core.editor "nano"
git config --global push.default simple
git config --global diff.tool vscode
git config --global difftool.vscode.cmd 'code-insiders --wait --diff "$LOCAL" "$REMOTE"'
git config --global apply.whitespace nowarn

git config --global mergetool.smerge.cmd 'smerge mergetool "$BASE" "$LOCAL" "$REMOTE" -o "$MERGED"'
git config --global merge.tool smerge
git config --global mergetool.prompt "false"
git config --global mergetool.keepBackup "false"
git config --global mergetool.keepTemporaries "false"

# Setup default git aliases
git config --global alias.ci "commit"
git config --global alias.a "add --all"
git config --global alias.br "branch --sort=-committerdate"
git config --global alias.ch "checkout"
git config --global alias.pr "pull --rebase"
git config --global alias.graph "log --all --graph --decorate --oneline -n30"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global 'alias.last-commit' "diff-tree --no-commit-id --name-only -r HEAD"
