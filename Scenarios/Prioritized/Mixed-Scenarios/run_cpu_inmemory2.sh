#!/bin/sh
set -e

# Pull images
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dataset
mkdir -p inMemoryTest
cd inMemoryTest
sudo docker create --name inmemorydatacpu2prio cloudsuite/movielens-dataset
cd ..

# Create the Graph Dataset
sudo docker create --name twitterdatacpu2prio cloudsuite/twitter-dataset-graph

# In-Memory Benchmark
sudo docker run -d -c 410 --rm --volumes-from inmemorydatacpu2prio --name inmemorycpu2-1prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 410 --rm --volumes-from inmemorydatacpu2prio --name inmemorycpu2-2prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &

# Graph-Analytic
sudo docker run -d -c 614 --rm --name graphanalyticcpu2-1prio --volumes-from twitterdatacpu2prio cloudsuite/graph-analytics &
sudo docker run -d -c 614 --rm --name graphanalyticcpu2-2prio --volumes-from twitterdatacpu2prio cloudsuite/graph-analytics


