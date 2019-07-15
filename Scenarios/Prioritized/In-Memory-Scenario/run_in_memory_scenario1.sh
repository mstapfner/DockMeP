#!/bin/sh

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTestSingleprio
cd inMemoryTestSingleprio
sudo docker create --name inmemorydatasingleprio cloudsuite/movielens-dataset

# Start Benchmark
sudo docker run -d -c 2048 --rm --volumes-from inmemorydatasingleprio --name inmemorybenchmarksingleprio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv
