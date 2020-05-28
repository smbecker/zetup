#!/bin/bash

wget -c https://azuredatastudiobuilds.blob.core.windows.net/releases/1.18.0/azuredatastudio-linux-1.18.0.deb -O azuredatastudio.linux.deb
sudo dpkg -i azuredatastudio.linux.deb
rm azuredatastudio.linux.deb

azuredatastudio --install-extension Microsoft.azuredatastudio-postgresql
azuredatastudio --install-extension Microsoft.profiler

mkdir -p $HOME/.config/azuredatastudio/User/
cp $HOME/zetup/config/datastudio/*.json $HOME/.config/azuredatastudio/User/