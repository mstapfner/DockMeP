#!/bin/sh
set -e

# 3 Graph Analytic Containers starting simultaneously with 1 Data Analytic Container

# Pull all images
sudo docker pull cloudsuite/hadoop
sudo docker pull cloudsuite/data-analytics
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create Data analytic network
sudo docker network create hadoop-net-3to1

# Create the Graph Dataset
sudo docker create --name twitterdata3to1 cloudsuite/twitter-dataset-graph

# Start the master for the data analytic benchmark
sudo docker run -d --net hadoop-net-3to1 --name hadoopmaster3to1 --hostname hadoopmaster \
             cloudsuite/data-analytics master

# Start the Graph Analytic benchmark
sudo docker run -d --rm --name graphanalytic3to11 --volumes-from twitterdata3to1 cloudsuite/graph-analytics &
sudo docker run -d --rm --name graphanalytic3to12 --volumes-from twitterdata3to1 cloudsuite/graph-analytics &
sudo docker run -d --rm --name graphanalytic3to13 --volumes-from twitterdata3to1 cloudsuite/graph-analytics &

# Start the Data Analytic Slave
sudo docker run -d --net hadoop-net-3to1 --name hadoopslave13to1 --hostname slave01 cloudsuite/hadoop slave &

# Start the data analytic Benchmark
sudo docker exec hadoopmaster3to1 benchmark
