#!/bin/bash

wget -q https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x dotnet-install.sh

sudo ./dotnet-install.sh --channel 3.1 --install-dir /usr/share/dotnet
sudo ./dotnet-install.sh --channel 5.0 --install-dir /usr/share/dotnet
sudo ./dotnet-install.sh --channel 6.0 --install-dir /usr/share/dotnet
sudo ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet

rm ./dotnet-install.sh

dotnet tool install --global dotnet-trace
dotnet tool install --global dotnet-counters
dotnet tool install --global dotnet-dump
dotnet tool install --global dotnet-gcdump
dotnet tool install --global dotnet-symbol
