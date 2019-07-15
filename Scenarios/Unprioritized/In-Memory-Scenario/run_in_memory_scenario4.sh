#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTestQuadruple
cd inMemoryTestQuadruple
sudo docker create --name inmemorydataquadruple cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d --rm --volumes-from inmemorydataquadruple --name inmemorydataquadruple1 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydataquadruple --name inmemorydataquadruple2 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydataquadruple --name inmemorydataquadruple3 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d --rm --volumes-from inmemorydataquadruple --name inmemorydataquadruple4 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv

