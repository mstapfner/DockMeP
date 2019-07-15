#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTest6
cd inMemoryTest6
sudo docker create --name inmemorydata6 cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d --rm --volumes-from inmemorydata6 --name inmemorydata6-1 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata6 --name inmemorydata6-2 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata6 --name inmemorydata6-3 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata6 --name inmemorydata6-4 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata6 --name inmemorydata6-5 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata6 --name inmemorydata6-6 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv

