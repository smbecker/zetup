#!/bin/bash

wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo add-apt-repository universe
sudo apt-get -y install apt-transport-https
sudo apt-get update
sudo apt-get -y install dotnet-sdk-3.0
