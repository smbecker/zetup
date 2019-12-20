#!/bin bash

export PATH=$PATH:/usr/sbin:$HOME/zetup/bin:$HOME/Tools/bin
PATH=$PATH:$( find $HOME/zetup/bin/ -type d -printf ":%p" )

export PATH=$PATH:$HOME/.npm/bin:$HOME/.local/bin
export PATH=$PATH:/opt/installbuilder-19.7.1/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 12.13.1 --silent

export GOPATH=/usr/local/go

alias chrome="google-chrome-stable"
alias "ls=ls --color=auto -l -G"

if [ -f "$HOME/Tools/bin/z.sh" ]; then
  . $HOME/Tools/bin/z.sh
fi

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  source $HOME/.bash-git-prompt/gitprompt.sh
fi

if [[ $HOME == "$(pwd)" ]]; then cd $HOME/dev ; fi

exportSecrets()
{
  for i in $(yq r $HOME/secrets/secrets.yml $1);
  do
    if [[ $(echo -e $i | tr -d '[:space:]') == *":" ]]; then
      set -- "$1" "0"
      i=${i:0:-1}
      if [[ $1 == "" ]];
        then subKey=$i;
        else subKey=$(echo -e "$1.${i}");
      fi
      exportSecrets $subKey 1
    elif [[ $2 == 1 && ! -z $i && $i != "null" ]]; then
      envKey=$1
      envKey=${envKey//./_}
      export ${envKey^^}=$i
    fi
  done
}

if [ -f "$HOME/secrets/secrets.yml" ]; then
  exportSecrets
fi

alias docker-stop-all-containers="docker stop \$(docker container ls -aq) && docker rm \$(docker container ls -aq)"
alias docker-machine-unset="eval \\$(docker-machine env -u)"
