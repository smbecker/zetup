#!/bin/bash

sudo apt install -y dos2unix

wget -q https://github.com/PowerShell/PowerShell/releases/download/v6.2.3/powershell_6.2.3-1.ubuntu.18.04_amd64.deb -O powershell.ubuntu.deb
sudo dpkg -i powershell.ubuntu.deb
rm powershell.ubuntu.deb
sudo apt install -f
