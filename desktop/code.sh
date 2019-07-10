#!/bin/bash

sudo snap install code-insiders --classic

code-insiders --install-extension christian-kohler.npm-intellisense
code-insiders --install-extension dbaeumer.vscode-eslint
code-insiders --install-extension EditorConfig.EditorConfig
code-insiders --install-extension esbenp.prettier-vscode
code-insiders --install-extension GitHub.vscode-pull-request-github
code-insiders --install-extension jock.svg
code-insiders --install-extension ms-azuretools.vscode-docker
code-insiders --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code-insiders --install-extension ms-python.python
code-insiders --install-extension ms-vscode.csharp
code-insiders --install-extension ms-vscode.powershell
code-insiders --install-extension ms-vscode.vscode-typescript-tslint-plugin
code-insiders --install-extension ms-vsliveshare.vsliveshare
code-insiders --install-extension msjsdiag.debugger-for-chrome
code-insiders --install-extension redhat.vscode-yaml
code-insiders --install-extension shinnn.stylelint

mkdir -p $HOME/.config/Code-Insiders/User/
cp $HOME/zetup/config/code/*.json $HOME/.config/Code-Insiders/User/
