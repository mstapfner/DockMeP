#!/bin/sh
set -e

# Pull images
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dataset
mkdir -p inMemoryTest
cd inMemoryTest
sudo docker create --name inmemorydataweb1prio cloudsuite/movielens-dataset
cd ..

# Download the Shop-Sock Github repo
git clone https://github.com/microservices-demo/microservices-demo ./microservices-demo

# Replace the Docker-compose with the updated version
rm -rf ./microservices-demo/deploy/docker-compose/docker-compose.yml
cp -f ../../../Shop-Sock-Changed/docker-compose-dp-im1.yml microservices-demo/deploy/docker-compose/docker-compose.yml

# Start the Docker-compose
sudo docker-compose -f ./microservices-demo/deploy/docker-compose/docker-compose.yml up -d

# The SSH Script has to be used to start the in-memory and k6 benchmark
