#!/bin/bash

mkdir -p $HOME/Tools/bin

wget -c https://download.jetbrains.com/rider/JetBrains.Rider-2019.2.2.tar.gz -O - | tar -xz -C $HOME/Tools/
mv $HOME/Tools/JetBrains\ Rider-2019.2.2/ $HOME/Tools/Rider/
chmod -R 777 $HOME/Tools/Rider/
ln -sf $HOME/Tools/Rider/bin/rider.sh $HOME/Tools/bin/rider

echo 'fs.inotify.max_user_watches = 524288' > 60-rider.conf
sudo mv 60-rider.conf /etc/sysctl.d/
sudo sysctl -p --system