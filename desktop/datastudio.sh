#!/bin/bash

sudo apt install -y libunwind8

wget -c https://sqlopsbuilds.azureedge.net/stable/0f5cfdc2c8c2433028842e16dc5ac1a65da24292/azuredatastudio-linux-1.29.0.deb -O azuredatastudio.linux.deb
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