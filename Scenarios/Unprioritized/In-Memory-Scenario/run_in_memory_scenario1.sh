#!/bin/sh

# Pull Docker images for In-Memory Test
sudo docker pull cloudsuite/in-memory-analytics
sudo docker pull cloudsuite/movielens-dataset

# Create Dir for the Dataset
mkdir -p inMemoryTestSingle
cd inMemoryTestSingle
sudo docker create --name inmemorydatasingle cloudsuite/movielens-dataset

# Start 2 Benchmarks
sudo docker run -d --rm --volumes-from inmemorydatasingle --name inmemorybenchmarksingle cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv
