#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTest10prio
cd inMemoryTest10prio
sudo docker create --name inmemorydata10prio cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d -c 410 --rm --volumes-from inmemorydata10prio --name inmemorydata10-1prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 410 --rm --volumes-from inmemorydata10prio --name inmemorydata10-2prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata10prio --name inmemorydata10-3prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata10prio --name inmemorydata10-4prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata10prio --name inmemorydata10-5prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata10prio --name inmemorydata10-6prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata10prio --name inmemorydata10-7prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata10prio --name inmemorydata10-8prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 102 --rm --volumes-from inmemorydata10prio --name inmemorydata10-9prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 205 --rm --volumes-from inmemorydata10prio --name inmemorydata10-10prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv

