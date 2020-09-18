#!/bin/bash

wget -c https://azuredatastudio-update.azurewebsites.net/1.21.0/linux-deb-x64/stable -O azuredatastudio.linux.deb
sudo dpkg -i azuredatastudio.linux.deb
rm azuredatastudio.linux.deb

azuredatastudio --install-extension Microsoft.azuredatastudio-postgresql
azuredatastudio --install-extension Microsoft.profiler

mkdir -p $HOME/.config/azuredatastudio/User/
cp $HOME/zetup/config/datastudio/*.json $HOME/.config/azuredatastudio/User/

# https://github.com/microsoft/pgtoolsservice/issues/239#issuecomment-653665504
sudo ln -s /usr/lib/x86_64-linux-gnu/libffi.so.7 /usr/lib/x86_64-linux-gnu/libffi.so.6