#!/bin/bash

sudo apt install -y libunwind8

wget -c https://sqlopsbuilds.azureedge.net/stable/fab63efd307e54c063c8af03474bbb5d77f5fd11/azuredatastudio-linux-1.35.1.deb -O azuredatastudio.linux.deb
sudo dpkg -i azuredatastudio.linux.deb
rm azuredatastudio.linux.deb

azuredatastudio --install-extension Microsoft.azuredatastudio-postgresql
azuredatastudio --install-extension Microsoft.profiler

mkdir -p $HOME/.config/azuredatastudio/User/
cp $HOME/zetup/config/datastudio/*.json $HOME/.config/azuredatastudio/User/

# https://github.com/microsoft/pgtoolsservice/issues/239#issuecomment-653665504
# https://stackoverflow.com/a/63329830
wget -c http://mirrors.kernel.org/ubuntu/pool/main/libf/libffi/libffi6_3.2.1-8_amd64.deb -O libffi6_3.deb
sudo dpkg -i libffi6_3.deb
rm libffi6_3.deb