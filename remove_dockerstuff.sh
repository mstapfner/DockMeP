#!/bin/sh
set -e

# Stop all Containers
sudo docker stop $(sudo docker ps -a -q)

# Remove all Containers
sudo docker rm $(sudo docker ps -a -q)

# Remove all images
sudo docker rmi $(sudo docker images -q)

# Prune the docker system
sudo docker system prune -y
