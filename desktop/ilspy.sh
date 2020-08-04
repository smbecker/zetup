#!/bin/bash

mkdir -p $HOME/Tools/ILSpy
mkdir -p $HOME/Tools/bin

wget -c https://ci.appveyor.com/api/projects/icsharpcode/avaloniailspy/artifacts/artifacts%2Fzips%2FILSpy-linux-x64-Release.zip?branch=master -O ilspy.zip
unzip ilspy.zip -d $HOME/Tools/ILSpy
rm ilspy.zip

chmod a+x $HOME/Tools/ILSpy/ILSpy
ln -s $HOME/Tools/ILSpy/ILSpy $HOME/Tools/bin/ILSpy