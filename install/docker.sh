#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose



base=https://github.com/docker/machine/releases/download/v0.16.2 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine

base=https://raw.githubusercontent.com/docker/machine/v0.16.2
for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
do
  sudo wget "$base/contrib/completion/bash/${i}" -P /etc/bash_completion.d
done

sudo systemctl enable docker
sudo setfacl -m $USER:rw /var/run/docker.sock
sudo usermod -aG docker $USER
sudo service docker start

# pull some commonly used images
for i in postgres mysql "Microsoft/mssql-server-linux" "mcr.microsoft.com/dotnet/core/runtime-deps:3.0-alpine";
do
    docker pull $i
done

# Automatically login if secret is available
if [ -f "$HOME/secrets/secrets.yml" ]; then
  dockerUser=$(yq r $HOME/secrets/secrets.yml docker.username)
  dockerPass=$(yq r $HOME/secrets/secrets.yml docker.password)
  if [[ ! -z $dockerUser ]]; then
    docker login -u $dockerUser -p $dockerPass
    docker pull store/oracle/database-enterprise:12.2.0.1
  fi
fi
