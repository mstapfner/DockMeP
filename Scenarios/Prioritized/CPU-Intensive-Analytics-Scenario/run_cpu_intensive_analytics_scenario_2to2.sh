#!/bin/sh
set -e

# Pull all images
sudo docker pull cloudsuite/hadoop
sudo docker pull cloudsuite/data-analytics
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create Data analytic network
sudo docker network create hadoop-net-2to2prio

# Create the Graph Dataset
sudo docker create --name twitterdata2to2prio cloudsuite/twitter-dataset-graph

# Start the master for the data analytic benchmark
sudo docker run -d -c 1147 --net hadoop-net-2to2prio --name hadoopmaster2to2prio --hostname hadoopmaster \
             cloudsuite/data-analytics master

# Start the Graph Analytic benchmark
sudo docker run -d -c 307 --rm --name graphanalytic2to21prio --volumes-from twitterdata2to2prio cloudsuite/graph-analytics &
sudo docker run -d -c 307 --rm --name graphanalytic2to22prio --volumes-from twitterdata2to2prio cloudsuite/graph-analytics &

# Start 2 slaves
sudo docker run -d -c 143 --net hadoop-net-2to2prio --name hadoopslave2to21prio --hostname slave01 cloudsuite/hadoop slave &
sudo docker run -d -c 143 --net hadoop-net-2to2prio --name hadoopslave2to22prio --hostname slave02 cloudsuite/hadoop slave &

# Start the data analytic Benchmark
sudo docker exec hadoopmaster2to2prio benchmark
