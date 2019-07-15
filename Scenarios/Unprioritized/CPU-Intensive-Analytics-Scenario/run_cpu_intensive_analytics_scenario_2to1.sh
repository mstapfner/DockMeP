#!/bin/sh
set -e

# 2 Graph Analytic starting simultaneously with 1 Data Analytic

# Pull all images
sudo docker pull cloudsuite/hadoop
sudo docker pull cloudsuite/data-analytics
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create Data analytic network
sudo docker network create hadoop-net-2to1

# Create the Graph Dataset
sudo docker create --name twitterdata2to1 cloudsuite/twitter-dataset-graph

# Start the master for the data analytic benchmark
sudo docker run -d --net hadoop-net-2to1 --name hadoopmaster2to1 --hostname hadoopmaster \
             cloudsuite/data-analytics master

# Start the Graph Analytic benchmark
sudo docker run -d --rm --name graphanalytic2to11 --volumes-from twitterdata2to1 cloudsuite/graph-analytics &
sudo docker run -d --rm --name graphanalytic2to12 --volumes-from twitterdata2to1 cloudsuite/graph-analytics &

# Start 2 slaves
sudo docker run -d --net hadoop-net-2to1 --name hadoopslave2to11 --hostname slave01 cloudsuite/hadoop slave &

# Start the data analytic Benchmark
sudo docker exec hadoopmaster2to1 benchmark
