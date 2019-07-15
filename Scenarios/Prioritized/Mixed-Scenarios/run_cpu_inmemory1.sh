#!/bin/sh
set -e

# Pull images
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dataset
mkdir -p inMemoryTest
cd inMemoryTest
sudo docker create --name inmemorydatacpu1prio cloudsuite/movielens-dataset
cd ..

# Create the Graph Dataset
sudo docker create --name twitterdatacpu1prio cloudsuite/twitter-dataset-graph

# In-Memory Benchmark
sudo docker run -d -c 1434 --rm --volumes-from inmemorydatacpu1prio --name inmemorycpu1prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &

# Graph-Analytic
sudo docker run -d -c 614 --rm --name graphanalyticcpu1prio --volumes-from twitterdatacpu1prio cloudsuite/graph-analytics


