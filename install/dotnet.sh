#!/bin/bash

mkdir -p $HOME/Tools

wget -q https://dot.net/v1/dotnet-install.sh -O $HOME/Tools/dotnet-install.sh
chmod +x $HOME/Tools/dotnet-install.sh

sudo $HOME/Tools/dotnet-install.sh --channel 6.0 --install-dir /usr/share/dotnet
sudo $HOME/Tools/dotnet-install.sh --channel 7.0 --install-dir /usr/share/dotnet
sudo $HOME/Tools/dotnet-install.sh --channel 8.0 --install-dir /usr/share/dotnet
sudo ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet

dotnet tool install --global dotnet-trace
dotnet tool install --global dotnet-counters
dotnet tool install --global dotnet-dump
dotnet tool install --global dotnet-gcdump
dotnet tool install --global dotnet-symbol
