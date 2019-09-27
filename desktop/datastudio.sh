#!/bin/bash

wget -c https://github.com/microsoft/azuredatastudio/releases/download/1.11.0/azuredatastudio-linux-1.11.0.deb
sudo dpkg -i azuredatastudio-linux-1.11.0.deb
rm azuredatastudio-linux-1.11.0.deb

azuredatastudio --install-extension Microsoft.azuredatastudio-postgresql
azuredatastudio --install-extension Microsoft.profiler

mkdir -p $HOME/.config/azuredatastudio/User/
cp $HOME/zetup/config/datastudio/*.json $HOME/.config/azuredatastudio/User/