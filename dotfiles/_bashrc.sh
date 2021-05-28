#!/bin bash

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export GEM_HOME=$HOME/.ruby/

export PATH=$PATH:/usr/sbin:$HOME/zetup/bin:$HOME/Tools/bin
export PATH=$PATH:$HOME/.npm/bin:$HOME/.local/bin
export PATH=$PATH:/opt/installbuilder-20.4.0/bin
export PATH=$PATH:$HOME/.dotnet/tools
export PATH=$PATH:$GEM_HOME/bin

# Look for CUDA
export CUDA_PATH=$(find /usr/local/ -maxdepth 1 -type d -name "cuda-*" -print | tail -n 1)
if [ "$CUDA_PATH" != "" ] && [ -d "$CUDA_PATH" ] ; then
  export PATH=$PATH:$CUDA_PATH/bin
fi

export NVM_DIR="$HOME/.nvm"
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

if [ -f /usr/share/bash-completion/completions/git ]; then
  source /usr/share/bash-completion/completions/git
fi

if [[ $HOME == "$(pwd)" ]]; then cd $HOME/dev ; fi
