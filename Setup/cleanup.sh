#!/bin/sh
set -e

# Remove Curl
sudo apt-get remove -y curl

# Remove Docker
sudo apt-get -y purge -y docker-engine docker docker.io docker-ce
sudo apt-get -y autoremove -y --purge docker-engine docker docker.io docker-ce
sudo rm -rf /var/lib/docker
sudo rm -rf /etc/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock

# Remove Docker-Compose
sudo rm -rf /usr/local/bin/docker-compose

# Remove Docker Installation Script
sudo rm -f ./get-docker.sh

# Success Message
echo "Removed Setup completely"
