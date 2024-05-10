#!/bin/bash

wget -c https://releases.warp.dev/stable/v0.2024.05.07.08.02.stable_02/warp-terminal_0.2024.05.07.08.02.stable.02_amd64.deb -O warp-terminal.deb
sudo dpkg -i warp-terminal.deb
rm warp-terminal.deb

mkdir -p $HOME/.config/warp-terminal
cp $HOME/zetup/config/warp-terminal/* $HOME/.config/warp-terminal/