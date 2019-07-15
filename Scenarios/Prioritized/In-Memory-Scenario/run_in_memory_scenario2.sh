#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTestDoubleprio
cd inMemoryTestDoubleprio
sudo docker create --name inmemorydatadoubleprio cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d --cpu-shares=1434 --volumes-from inmemorydatadoubleprio --name inmemorybenchmarkdouble1prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --cpu-shares=614 --volumes-from inmemorydatadoubleprio --name inmemorybenchmarkdouble2prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv

