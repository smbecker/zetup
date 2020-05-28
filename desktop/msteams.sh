#!/bin/bash

wget -q 'https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb' -O packages-microsoft-teams.deb
sudo dpkg -i packages-microsoft-teams.deb
rm packages-microsoft-teams.deb
