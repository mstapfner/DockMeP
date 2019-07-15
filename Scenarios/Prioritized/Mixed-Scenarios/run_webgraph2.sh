#!/bin/sh
set -e

# Pull images
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create the Graph Dataset
sudo docker create --name twitterdataweb2prio cloudsuite/twitter-dataset-graph

# Download the Shop-Sock Github repo
git clone https://github.com/microservices-demo/microservices-demo

# Replace the Docker-compose with the updated version
rm -rf ./microservices-demo/deploy/docker-compose/docker-compose.yml
cp -f ../../../Shop-Sock-Changed/docker-compose-dp-wg2.yml microservices-demo/deploy/docker-compose/docker-compose.yml

# Start the Docker-compose
sudo docker-compose -f ./microservices-demo/deploy/docker-compose/docker-compose.yml up -d

# Start the Graph Analytic Benchmark
sudo docker run -d -c 512 --rm --name graphanalyticsweb21prio --volumes-from twitterdataweb2prio cloudsuite/graph-analytics
sudo docker run -d -c 512 --rm --name graphanalyticsweb22prio --volumes-from twitterdataweb2prio cloudsuite/graph-analytics
