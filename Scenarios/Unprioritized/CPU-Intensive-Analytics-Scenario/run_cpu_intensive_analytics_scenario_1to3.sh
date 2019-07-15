#!/bin/sh
set -e

# 1 Graph Analytic Container starting simulatenously with 3 Data Analytic Container

# Pull all images
sudo docker pull cloudsuite/hadoop
sudo docker pull cloudsuite/data-analytics
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create Data analytic network
sudo docker network create hadoop-net-1to3

# Create the Graph Dataset
sudo docker create --name twitterdata1to3 cloudsuite/twitter-dataset-graph

# Start the master for the data analytic benchmark
sudo docker run -d --net hadoop-net-1to3 --name hadoopmaster1to3 --hostname hadoopmaster \
             cloudsuite/data-analytics master

# Start the Graph Analytic benchmark
sudo docker run -d --rm --name graphanalytic1to3 --volumes-from twitterdata1to3 cloudsuite/graph-analytics &

# Start 2 slaves
sudo docker run -d --net hadoop-net-1to3 --name hadoopslave1to31 --hostname slave1to31 cloudsuite/hadoop slave &
sudo docker run -d --net hadoop-net-1to3 --name hadoopslave1to32 --hostname slave1to32 cloudsuite/hadoop slave &
sudo docker run -d --net hadoop-net-1to3 --name hadoopslave1to33 --hostname slave1to33 cloudsuite/hadoop slave &

# Start the data analytic Benchmark
sudo docker exec hadoopmaster1to3 benchmark
