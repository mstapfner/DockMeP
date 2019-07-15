#!/bin/sh
set -e

# Pull images
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dataset
mkdir -p inMemoryTest
cd inMemoryTest
sudo docker create --name inmemorydatacpu3 cloudsuite/movielens-dataset
cd ..

# Create the Graph Dataset
sudo docker create --name twitterdatacpu3 cloudsuite/twitter-dataset-graph

# In-Memory Benchmark
sudo docker run -d --rm --volumes-from inmemorydatacpu3 --name inmemorycpu3-1 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydatacpu3 --name inmemorycpu3-2 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydatacpu3 --name inmemorycpu3-2 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &

# Graph-Analytic
sudo docker run -d --rm --name graphanalyticcpu3-1 --volumes-from twitterdatacpu3 cloudsuite/graph-analytics &
sudo docker run -d --rm --name graphanalyticcpu3-2 --volumes-from twitterdatacpu3 cloudsuite/graph-analytics &
sudo docker run -d --rm --name graphanalyticcpu3-3 --volumes-from twitterdatacpu3 cloudsuite/graph-analytics


