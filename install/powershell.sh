#!/bin/bash

sudo apt install -y dos2unix
sudo snap install powershell --classic

sudo ln -sf /snap/bin/pwsh /usr/local/bin/pwsh
