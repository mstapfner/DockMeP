#!/bin/sh
set -e

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTestTripleprio
cd inMemoryTestTripleprio
sudo docker create --name inmemorydatatripleprio cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d -c 410 --rm --volumes-from inmemorydatatripleprio --name inmemorybenchmarktriple1prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 1229 --rm --volumes-from inmemorydatatripleprio --name inmemorybenchmarktriple2prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
sudo docker run -d -c 410 --rm --volumes-from inmemorydatatripleprio --name inmemorybenchmarktriple3prio cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv
