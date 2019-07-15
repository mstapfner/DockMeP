#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTest8
cd inMemoryTest8
sudo docker create --name inmemorydata8 cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d --rm --volumes-from inmemorydata8 --name inmemorydata8-1 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata8 --name inmemorydata8-2 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata8 --name inmemorydata8-3 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata8 --name inmemorydata8-4 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata8 --name inmemorydata8-5 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata8 --name inmemorydata8-6 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata8 --name inmemorydata8-7 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydata8 --name inmemorydata8-8 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &

