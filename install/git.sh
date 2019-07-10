#!/bin/bash

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Setup LFS support and hub
sudo add-apt-repository ppa:cpick/hub -y
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install -y git-lfs hub
git lfs install

# Setup difftool and mergetool
git config --global code.editor "code-insiders --wait"
git config --global push.default simple
git config --global diff.tool vscode
git config --global difftool.prompt "false"
git config --global difftool.vscode.cmd 'code-insiders --wait --diff "$LOCAL" "$REMOTE"'
git config --global apply.whitespace nowarn

sudo apt install -y meld
git config --global merge.tool meld
git config --global mergetool.prompt "false"
git config --global mergetool.meld.cmd 'meld "$LOCAL" "$MERGED" "$REMOTE" --output "$MERGED"'

# Setup default git aliases
git config --global alias.ci "commit"
git config --global alias.a "add --all"
git config --global alias.br "branch --sort=-committerdate"
git config --global alias.ch "checkout"
git config --global alias.pr "pull --rebase"
git config --global alias.graph "log --all --graph --decorate --oneline -n30"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global 'alias.last-commit' "diff-tree --no-commit-id --name-only -r HEAD"
