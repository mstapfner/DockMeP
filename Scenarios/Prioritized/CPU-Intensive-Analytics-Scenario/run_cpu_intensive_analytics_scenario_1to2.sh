#!/bin/sh
set -e

# 1 Graph Analytic starting simultaneously with 2 Data Analytic

# Pull all images
sudo docker pull cloudsuite/hadoop
sudo docker pull cloudsuite/data-analytics
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create Data analytic network
sudo docker network create hadoop-net-1to2prio

# Create the Graph Dataset
sudo docker create --name twitterdata1to2prio cloudsuite/twitter-dataset-graph

# Start the master for the data analytic benchmark
sudo docker run -d -c 655 --net hadoop-net-1to2prio --name hadoopmaster1to2prio --hostname hadoopmaster cloudsuite/data-analytics master

# Start the Graph Analytic benchmark
sudo docker run -d -c 410 --rm --name graphanalytic1to21prio --volumes-from twitterdata1to2prio cloudsuite/graph-analytics &

# Start 2 slaves
sudo docker run -d -c 82 --net hadoop-net-1to2prio --name hadoopslave1to21prio --hostname slave01 cloudsuite/hadoop slave &
sudo docker run -d -c 82 --net hadoop-net-1to2prio --name hadoopslave1to22prio --hostname slave02 cloudsuite/hadoop slave &

# Start the data analytic Benchmark
sudo docker exec hadoopmaster1to2prio benchmark
