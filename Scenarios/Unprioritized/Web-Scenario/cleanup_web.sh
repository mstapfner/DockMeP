#!/bin/sh

# Delete all containers
sudo docker-compose -f microservices-demo/deploy/docker-compose/docker-compose.yml down

# delete folder
rm -rf microservices-demo
