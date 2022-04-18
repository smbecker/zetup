#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/2.4.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
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
# for i in postgres mysql "mcr.microsoft.com/mssql/server:2019-latest";
# do
#     docker pull $i
# done

# Automatically login if secret is available
if [ -f "$HOME/secrets/secrets.yml" ]; then
  dockerUser=$(yq r $HOME/secrets/secrets.yml docker.username)
  dockerPass=$(yq r $HOME/secrets/secrets.yml docker.password)
  if [[ ! -z $dockerUser ]]; then
    docker login -u $dockerUser -p $dockerPass
#    docker pull store/oracle/database-enterprise:12.2.0.1
  fi
fi

# Install nvidia-container-runtime
if [ "$(lspci | grep -i nvidia)" != "" ]; then
  curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | sudo apt-key add -
  curl -s -L https://nvidia.github.io/nvidia-container-runtime/ubuntu20.04/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
  sudo apt update
  sudo apt install -y nvidia-container-runtime
  sudo tee /etc/docker/daemon.json <<EOF
{
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF
  sudo systemctl daemon-reload
  sudo systemctl restart docker
fi
