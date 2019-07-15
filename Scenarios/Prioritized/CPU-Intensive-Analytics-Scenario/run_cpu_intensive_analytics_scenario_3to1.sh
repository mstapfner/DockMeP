#!/bin/sh
set -e

# 3 Graph Analytic Containers starting simultaneously with 1 Data Analytic Container

# Pull all images
sudo docker pull cloudsuite/hadoop
sudo docker pull cloudsuite/data-analytics
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create Data analytic network
sudo docker network create hadoop-net-3to1prio

# Create the Graph Dataset
sudo docker create --name twitterdata3to1prio cloudsuite/twitter-dataset-graph

# Start the master for the data analytic benchmark
sudo docker run -d -c 1147 --net hadoop-net-3to1prio --name hadoopmaster3to1prio --hostname hadoopmaster \
             cloudsuite/data-analytics master

# Start the Graph Analytic benchmark
sudo docker run -d -c 205 --rm --name graphanalytic3to11prio --volumes-from twitterdata3to1prio cloudsuite/graph-analytics &
sudo docker run -d -c 205 --rm --name graphanalytic3to12prio --volumes-from twitterdata3to1prio cloudsuite/graph-analytics &
sudo docker run -d -c 205 --rm --name graphanalytic3to13prio --volumes-from twitterdata3to1prio cloudsuite/graph-analytics &

# Start the Data Analytic Slave
sudo docker run -d -c 287 --net hadoop-net-3to1prio --name hadoopslave13to1prio --hostname slave01 cloudsuite/hadoop slave &

# Start the data analytic Benchmark
sudo docker exec hadoopmaster3to1prio benchmark
