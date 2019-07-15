#!/bin/sh
set -e

# Sequential Start of Data-Analytic and Graph-Analytic Benchmark

# Pull all images
sudo docker pull cloudsuite/hadoop
sudo docker pull cloudsuite/data-analytics
sudo docker pull cloudsuite/graph-analytics
sudo docker pull cloudsuite/twitter-dataset-graph

# Create Data analytic network
sudo docker network create hadoop-net-singleprio

# Create the Graph Dataset
sudo docker create --name twitterdataprio cloudsuite/twitter-dataset-graph

# Start the master for the data analytic benchmark
sudo docker run -d -c 1147 --net hadoop-net-singleprio --name hadoopmastersingleprio --hostname hadoopmaster cloudsuite/data-analytics master &

# Start the Client for the data analytic benchmark
sudo docker run -d -c 287 --net hadoop-net-singleprio --name hadoopslave01singleprio --hostname slave01 cloudsuite/hadoop slave &

# Wait 10 seconds
sleep 10

# Start the data analytic Benchmark
sudo docker exec hadoopmastersingleprio benchmark &

# Start the Graph Analytic Benchmark
sudo docker run -d -c 614 --rm --name graphanalyticsingleprio --volumes-from twitterdataprio cloudsuite/graph-analytics
