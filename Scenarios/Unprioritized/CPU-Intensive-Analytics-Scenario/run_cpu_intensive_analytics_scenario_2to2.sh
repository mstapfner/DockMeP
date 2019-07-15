#!/bin/sh
set -e

# Pull all images
sudo docker pull cloudsuite/hadoop
sudo docker pull cloudsuite/data-analytics
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create Data analytic network
sudo docker network create hadoop-net-2to2

# Create the Graph Dataset
sudo docker create --name twitterdata2to2 cloudsuite/twitter-dataset-graph

# Start the master for the data analytic benchmark
sudo docker run -d --net hadoop-net-2to2 --name hadoopmaster2to2 --hostname hadoopmaster \
             cloudsuite/data-analytics master

# Start the Graph Analytic benchmark
sudo docker run -d --rm --name graphanalytic2to21 --volumes-from twitterdata2to2 cloudsuite/graph-analytics &
sudo docker run -d --rm --name graphanalytic2to22 --volumes-from twitterdata2to2 cloudsuite/graph-analytics &

# Start 2 slaves
sudo docker run -d --net hadoop-net-2to2 --name hadoopslave2to21 --hostname slave01 cloudsuite/hadoop slave &
sudo docker run -d --net hadoop-net-2to2 --name hadoopslave2to22 --hostname slave02 cloudsuite/hadoop slave &

# Start the data analytic Benchmark
sudo docker exec hadoopmaster2to2 benchmark
