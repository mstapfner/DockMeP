#!/bin/sh
set -e

# Script from Anshul Jindal (https://github.com/ansjin/docker-node-monitoring)
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
curl -XPOST 'http://5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "remoteInstance"'
git clone https://github.com/mstapfner/docker-node-monitoring.git
FILE="docker-node-monitoring/local/prometheus/prometheus.yml"
cat <<EOT >> $FILE
remote_write:
  - url: "http://5.189.144.254:8086/api/v1/prom/write?db=remoteInstance&u=admin&p=os234guivahdf1a"
remote_read:
  - url: "http://5.189.144.254:8086/api/v1/prom/read?db=remoteInstance&u=admin&p=os234guivahdf1a"
EOT
cd docker-node-monitoring/local/scripts
sudo sh ./deploy_app.sh
