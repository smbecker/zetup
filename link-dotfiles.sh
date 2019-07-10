#!/bin/bash

for i in ~/zetup/dotfiles/*;
 do
   bn=$(basename $i) ;
   if [[ ! "$bn" = _* ]] ;
     then ln -sf "$i" "$HOME/.${bn%%.*}";
   fi
done

