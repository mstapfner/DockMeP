#!/bin/sh
set -e

# Pull images
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dataset
mkdir -p inMemoryTest
cd inMemoryTest
sudo docker create --name inmemorydatacpu1 cloudsuite/movielens-dataset
cd ..

# Create the Graph Dataset
sudo docker create --name twitterdatacpu1 cloudsuite/twitter-dataset-graph

# In-Memory Benchmark
sudo docker run -d --rm --volumes-from inmemorydatacpu1 --name inmemorycpu1 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &

# Graph-Analytic
sudo docker run -d --rm --name graphanalyticcpu1 --volumes-from twitterdatacpu1 cloudsuite/graph-analytics


