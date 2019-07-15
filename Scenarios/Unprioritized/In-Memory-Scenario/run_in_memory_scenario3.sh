#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTestTriple
cd inMemoryTestTriple
sudo docker create --name inmemorydatatriple cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d --rm --volumes-from inmemorydatatriple --name inmemorybenchmarktriple1 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydatatriple --name inmemorybenchmarktriple2 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydatatriple --name inmemorybenchmarktriple3 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv
