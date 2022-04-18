#!/bin/bash

sudo snap install code-insiders --classic

code-insiders --install-extension ms-vscode.cpptools
code-insiders --install-extension ms-dotnettools.csharp
code-insiders --install-extension ms-azuretools.vscode-docker
code-insiders --install-extension earthly.earthfile-syntax-highlighting
code-insiders --install-extension EditorConfig.EditorConfig
code-insiders --install-extension dbaeumer.vscode-eslint
code-insiders --install-extension GitHub.vscode-pull-request-github
code-insiders --install-extension christian-kohler.npm-intellisense
code-insiders --install-extension jebbs.plantuml
code-insiders --install-extension ms-vscode.powershell
code-insiders --install-extension esbenp.prettier-vscode
code-insiders --install-extension ms-python.vscode-pylance
code-insiders --install-extension ms-python.python
code-insiders --install-extension redhat.vscode-commons
code-insiders --install-extension ms-vscode-remote.remote-containers
code-insiders --install-extension ms-vscode-remote.remote-ssh
code-insiders --install-extension ms-vscode-remote.remote-ssh-edit
code-insiders --install-extension jock.svg
code-insiders --install-extension ms-vscode.vscode-typescript-tslint-plugin
code-insiders --install-extension redhat.vscode-yaml
code-insiders --install-extension anweber.vscode-httpyac

mkdir -p $HOME/.config/'Code - Insiders'/User/
cp $HOME/zetup/config/code/*.json $HOME/.config/'Code - Insiders'/User/
