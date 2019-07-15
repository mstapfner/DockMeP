#!/bin/sh

# Docker-compose stop
cd ./microservices-demo/deploy/docker-compose/
sudo docker-compose down

cd ../../../

# Remove Container
sudo rm -rf ./microservices-demo
sudo rm -rf ./inMemoryTest

# Delete all containers
sudo docker rm twitterdataweb1
sudo docker rm twitterdataweb3
sudo docker rm twitterdataweb2
sudo docker rm graphanalyticsweb1
sudo docker rm graphanalyticsweb21
sudo docker rm graphanalyticsweb22
sudo docker rm inmemorydataweb1
sudo docker rm inmemorydataweb2
sudo docker rm inmemorydataweb3

sudo docker rm inmemorydatacpu1
sudo docker rm inmemorydatacpu2
sudo docker rm inmemorydatacpu3

sudo docker rm twitterdatacpu1
sudo docker rm twitterdatacpu2
sudo docker rm twitterdatacpu3

sudo docker rm inmemorycpu1
sudo docker rm graphanalyticcpu1
sudo docker rm inmemorycpu2-1
sudo docker rm inmemorycpu2-2
sudo docker rm graphanalyticcpu2-1
sudo docker rm graphanalyticcpu2-2
sudo docker rm inmemorycpu3-1
sudo docker rm inmemorycpu3-2
sudo docker rm inmemorycpu3-3
sudo docker rm graphanalyticcpu3-1
sudo docker rm graphanalyticcpu3-2
sudo docker rm graphanalyticcpu3-3

# Delete all images
sudo docker rmi cloudsuite/hadoop
sudo docker rmi cloudsuite/data-analytics
sudo docker rmi cloudsuite/web-search:server
sudo docker rmi cloudsuite/web-search:client
sudo docker rmi cloudsuite/graph-analytics
sudo docker rmi cloudsuite/twitter-dataset-graph


# Delete all Networks
sudo docker network rm search-network-web-cpu1
sudo docker network rm search-network-web-cpu2
sudo docker network rm hadoop-network-web-cpu2
