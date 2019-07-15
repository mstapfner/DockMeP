#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTest6prio
cd inMemoryTest6prio
sudo docker create --name inmemorydata6prio cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d -c 205 --rm --volumes-from inmemorydata6prio --name inmemorydata6-1prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 410 --rm --volumes-from inmemorydata6prio --name inmemorydata6-2prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 614 --rm --volumes-from inmemorydata6prio --name inmemorydata6-3prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 205 --rm --volumes-from inmemorydata6prio --name inmemorydata6-4prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 205 --rm --volumes-from inmemorydata6prio --name inmemorydata6-5prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 410 --rm --volumes-from inmemorydata6prio --name inmemorydata6-6prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv
