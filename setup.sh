#!/bin/bash

echo "Linking dotfiles"
./link-dotfiles.sh

echo "Installing programs"
for f in ./install/*.sh; do
  . $f
done

if [[ -z $IN_CONTAINER || ! $IN_CONTAINER ]]; then
  echo "Installing desktop programs"
  for f in ./desktop/*.sh; do
    . $f
  done

  echo "Installing fonts"
  ./fonts.sh

  echo "Customizing UI"
  ./ui/unity.sh
fi

source ~/.bashrc

if [ -f $HOME/zetup/custom/setup.sh ];
then . $HOME/zetup/custom/setup.sh;
fi

echo 'All Done!'
