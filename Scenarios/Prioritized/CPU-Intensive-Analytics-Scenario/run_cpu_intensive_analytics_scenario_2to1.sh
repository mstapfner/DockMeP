#!/bin/sh
set -e

# 2 Graph Analytic starting simultaneously with 1 Data Analytic

# Pull all images
sudo docker pull cloudsuite/hadoop
sudo docker pull cloudsuite/data-analytics
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create Data analytic network
sudo docker network create hadoop-net-2to1prio

# Create the Graph Dataset
sudo docker create --name twitterdata2to1prio cloudsuite/twitter-dataset-graph

# Start the master for the data analytic benchmark
sudo docker run -d -c 1147 --net hadoop-net-2to1prio --name hadoopmaster2to1prio --hostname hadoopmaster \
             cloudsuite/data-analytics master

# Start the Graph Analytic benchmark
sudo docker run -d -c 307 --rm --name graphanalytic2to11prio --volumes-from twitterdata2to1prio cloudsuite/graph-analytics &
sudo docker run -d -c 307 --rm --name graphanalytic2to12prio --volumes-from twitterdata2to1prio cloudsuite/graph-analytics &

# Start 1 slave
sudo docker run -d -c 287 --net hadoop-net-2to1prio --name hadoopslave2to11prio --hostname slave01 cloudsuite/hadoop slave &

# Start the data analytic Benchmark
sudo docker exec hadoopmaster2to1prio benchmark
