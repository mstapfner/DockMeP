#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTestQuadrupleprio
cd inMemoryTestQuadrupleprio
sudo docker create --name inmemorydataquadrupleprio cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d -c 205 --rm --volumes-from inmemorydataquadrupleprio --name inmemorydataquadruple1prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 1024 --rm --volumes-from inmemorydataquadrupleprio --name inmemorydataquadruple2prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 614 --rm --volumes-from inmemorydataquadrupleprio --name inmemorydataquadruple3prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 209 --rm --volumes-from inmemorydataquadrupleprio --name inmemorydataquadruple4prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv

