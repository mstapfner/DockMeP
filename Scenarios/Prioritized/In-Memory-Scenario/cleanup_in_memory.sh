#!/bin/sh

# Delete all containers
sudo docker rm inmemorydatasingleprio
sudo docker rm inmemorydatadoubleprio
sudo docker rm inmemorydatatripleprio
sudo docker rm inmemorydataquadrupleprio
sudo docker rm inmemorybenchmarksingleprio
sudo docker rm inmemorybenchmarkdouble1prio
sudo docker rm inmemorybenchmarkdouble2prio
sudo docker rm inmemorybenchmarktriple1prio
sudo docker rm inmemorybenchmarktriple2prio
sudo docker rm inmemorybenchmarktriple3prio
sudo docker rm inmemorydataquadruple1prio
sudo docker rm inmemorydataquadruple2prio
sudo docker rm inmemorydataquadruple3prio
sudo docker rm inmemorydataquadruple4prio


# Delete all images
sudo docker rmi cloudsuite/in-memory-analytics
sudo docker rmi cloudsuite/movielens-dataset
