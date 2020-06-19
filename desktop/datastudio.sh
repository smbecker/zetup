#!/bin/bash

wget -c https://azuredatastudio-update.azurewebsites.net/1.19.0/linux-deb-x64/stable -O azuredatastudio.linux.deb
sudo dpkg -i azuredatastudio.linux.deb
rm azuredatastudio.linux.deb

azuredatastudio --install-extension Microsoft.azuredatastudio-postgresql
azuredatastudio --install-extension Microsoft.profiler

mkdir -p $HOME/.config/azuredatastudio/User/
cp $HOME/zetup/config/datastudio/*.json $HOME/.config/azuredatastudio/User/