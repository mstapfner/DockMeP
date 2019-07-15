#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTest8prio
cd inMemoryTest8prio
sudo docker create --name inmemorydata8prio cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d -c 102 --rm --volumes-from inmemorydata8prio --name inmemorydata8-1prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata8prio --name inmemorydata8-2prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata8prio --name inmemorydata8-3prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata8prio --name inmemorydata8-4prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata8prio --name inmemorydata8-5prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata8prio --name inmemorydata8-6prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 717 --rm --volumes-from inmemorydata8prio --name inmemorydata8-7prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 717 --rm --volumes-from inmemorydata8prio --name inmemorydata8-8prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv

