#!/bin/bash

sudo apt -y install unzip

mkdir -p $HOME/Tools/bin
mkdir -p $HOME/Tools/ILSpy

wget -c https://github.com/icsharpcode/AvaloniaILSpy/releases/download/v4.0-rc1/ILSpy-ubuntu.14.04-x64-Release.zip -P $HOME/Tools/ILSpy
unzip $HOME/Tools/ILSpy/ILSpy-ubuntu.14.04-x64-Release.zip -d $HOME/Tools/ILSpy
chmod +x $HOME/Tools/ILSpy/ILSpy
ln -sf $HOME/Tools/ILSpy/ILSpy $HOME/Tools/bin/ILSpy
