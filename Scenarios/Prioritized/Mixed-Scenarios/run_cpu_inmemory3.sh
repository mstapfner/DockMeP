#!/bin/sh
set -e

# Pull images
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dataset
mkdir -p inMemoryTest
cd inMemoryTest
sudo docker create --name inmemorydatacpu3prio cloudsuite/movielens-dataset
cd ..

# Create the Graph Dataset
sudo docker create --name twitterdatacpu3prio cloudsuite/twitter-dataset-graph

# In-Memory Benchmark
sudo docker run -d -c 143 --rm --volumes-from inmemorydatacpu3prio --name inmemorycpu3-1prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 143 --rm --volumes-from inmemorydatacpu3prio --name inmemorycpu3-2prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 143 --rm --volumes-from inmemorydatacpu3prio --name inmemorycpu3-3prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &

# Graph-Analytic
sudo docker run -d -c 532 --rm --name graphanalyticcpu3-1prio --volumes-from twitterdatacpu3prio cloudsuite/graph-analytics &
sudo docker run -d -c 532 --rm --name graphanalyticcpu3-2prio --volumes-from twitterdatacpu3prio cloudsuite/graph-analytics &
sudo docker run -d -c 532 --rm --name graphanalyticcpu3-3prio --volumes-from twitterdatacpu3prio cloudsuite/graph-analytics


