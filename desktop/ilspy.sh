#!/bin/bash

mkdir -p $HOME/Tools/ILSpy
mkdir -p $HOME/Tools/bin

rm -rf $HOME/Tools/ILSpy/*

wget -c https://github.com/icsharpcode/AvaloniaILSpy/releases/download/v7.1-rc/Linux.x64.Release.zip -O ilspy.zip
unzip ilspy.zip -d $HOME/Tools/ILSpy
rm ilspy.zip
rm -rf $HOME/Tools/ILSpy/__MACOSX

chmod a+x $HOME/Tools/ILSpy/linux-x64/ILSpy
rm -f $HOME/Tools/bin/ILSpy
ln -s $HOME/Tools/ILSpy/linux-x64/ILSpy $HOME/Tools/bin/ILSpy