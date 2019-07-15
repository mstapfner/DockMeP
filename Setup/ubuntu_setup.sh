#!/bin/sh
set -e

# Update Ubuntu
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Curl
sudo apt-get install -y curl  apt-transport-https ca-certificates software-properties-common


# Install Docker using the Setup provided by https://get.docker.com
sudo apt-get purge -y docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce

# Install Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Make Docker accessible without sudo
#sudo usermod -aG docker marko

# Success Message
echo "Installation & Setup installed successfully"
