#!/usr/bin/env bash

#https://docs.docker.com/engine/install/ubuntu/

sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl --request GET --fail --location https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
[ "$(sudo APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=false apt-key fingerprint 0EBFCD88 | grep -c "Docker Release")" != 1 ] && echo "ERROR: Docker repository fingerprint cannot be confirmed." && exit 1

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"Repository

sudo apt-get -y install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker "$USER"

sudo curl --request GET --fail --location "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
