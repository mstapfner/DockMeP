#!/bin/sh
set -e

# Pull images
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dataset
mkdir -p inMemoryTest
cd inMemoryTest
sudo docker create --name inmemorydatacpu2 cloudsuite/movielens-dataset
cd ..

# Create the Graph Dataset
sudo docker create --name twitterdatacpu2 cloudsuite/twitter-dataset-graph

# In-Memory Benchmark
sudo docker run -d --rm --volumes-from inmemorydatacpu2 --name inmemorycpu2-1 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydatacpu2 --name inmemorycpu2-2 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &

# Graph-Analytic
sudo docker run -d --rm --name graphanalyticcpu2-1 --volumes-from twitterdatacpu2 cloudsuite/graph-analytics &
sudo docker run -d --rm --name graphanalyticcpu2-2 --volumes-from twitterdatacpu2 cloudsuite/graph-analytics


