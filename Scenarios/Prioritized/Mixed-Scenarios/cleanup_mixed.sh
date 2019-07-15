#!/bin/sh

# Docker-compose stop
cd ./microservices-demo/deploy/docker-compose/
sudo docker-compose down

cd ../../../

# Remove Container
sudo rm -rf ./microservices-demo
sudo rm -rf ./inMemoryTest

# Delete all containers
sudo docker rm twitterdataweb1prio
sudo docker rm twitterdataweb3prio
sudo docker rm twitterdataweb2prio
sudo docker rm graphanalyticsweb1prio
sudo docker rm graphanalyticsweb21prio
sudo docker rm graphanalyticsweb22prio
sudo docker rm inmemorydataweb1prio
sudo docker rm inmemorydataweb2prio
sudo docker rm inmemorydataweb3prio

sudo docker rm inmemorydatacpu1prio
sudo docker rm inmemorydatacpu2prio
sudo docker rm inmemorydatacpu3prio

sudo docker rm inmemorycpu1prio
sudo docker rm graphanalyticcpu1prio
sudo docker rm inmemorycpu2-1prio
sudo docker rm inmemorycpu2-2prio
sudo docker rm graphanalyticcpu2-1prio
sudo docker rm graphanalyticcpu2-2prio
sudo docker rm inmemorycpu3-1prio
sudo docker rm inmemorycpu3-2prio
sudo docker rm inmemorycpu3-3prio
sudo docker rm graphanalyticcpu3-1prio
sudo docker rm graphanalyticcpu3-2prio
sudo docker rm graphanalyticcpu3-3prio

sudo docker rm twitterdatacpu1prio
sudo docker rm twitterdatacpu2prio
sudo docker rm twitterdatacpu3prio

# Delete all images
sudo docker rmi cloudsuite/hadoop
sudo docker rmi cloudsuite/data-analytics
sudo docker rmi cloudsuite/web-search:server
sudo docker rmi cloudsuite/web-search:client
sudo docker rmi cloudsuite/graph-analytics
sudo docker rmi cloudsuite/twitter-dataset-graph


# Delete all Networks
sudo docker network rm search-network-web-cpu1prio
sudo docker network rm search-network-web-cpu2prio
sudo docker network rm hadoop-network-web-cpu2prio
