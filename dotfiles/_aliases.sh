#!/bin bash

alias showip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias powershell="pwsh"
alias vscode="code-insiders"
alias code="code-insiders"
alias kdiff="kdiff3"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~/dev"
alias docker-stop-all-containers="docker stop \$(docker container ls -aq) && docker rm \$(docker container ls -aq)"
#alias docker-machine-unset="eval \\$(docker-machine env -u)"
