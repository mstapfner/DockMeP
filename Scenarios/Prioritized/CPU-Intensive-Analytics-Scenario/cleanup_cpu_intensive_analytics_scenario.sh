#!/bin/sh

# Delete all containers
sudo docker rm twitterdataprio
sudo docker rm hadoopmastersingleprio
sudo docker rm hadoopslave01singleprio
sudo docker rm graphanalyticsingleprio
# 1 to 2 Scenatio
sudo docker rm twitterdata1to2prio
sudo docker rm hadoopmaster1to2prio
sudo docker rm graphanalytic1to21prio
sudo docker rm hadoopslave1to21prio
sudo docker rm hadoopslave1to22prio
# 1 to 3 Scenario
sudo docker rm twitterdata1to3prio
sudo docker rm hadoopmaster1to3prio
sudo docker rm graphanalytic1to3prio
sudo docker rm hadoopslave1to31prio
sudo docker rm hadoopslave1to32prio
sudo docker rm hadoopslave1to33prio
# 2 to 1 Scenario
sudo docker rm hadoopmaster2to1prio
sudo docker rm twitterdata2to1prio
sudo docker rm graphanalytic2to11prio
sudo docker rm graphanalytic2to12prio
sudo docker rm hadoopslave2to11prio
# 2 to 2 Scenario
sudo docker rm twitterdata2to2prio
sudo docker rm hadoopmaster2to2prio
sudo docker rm graphanalytic2to2prio
sudo docker rm graphanalytic2to2prio
sudo docker rm hadoopslave2to21prio
sudo docker rm hadoopslave2to22prio
# 3 to 1 Scenario
sudo docker rm twitterdata3to1prio
sudo docker rm hadoopmaster3to1prio
sudo docker rm graphanalytic3to11prio
sudo docker rm graphanalytic3to12prio
sudo docker rm graphanalytic3to13prio
sudo docker rm hadoopslave013to1prio

# Delete all images
sudo docker rmi cloudsuite/hadoop
sudo docker rmi cloudsuite/data-analytics
sudo docker rmi cloudsuite/graph-analytics
sudo docker rmi cloudsuite/twitter-dataset-graph

# Delete all Networks
sudo docker network rm hadoop-net-singleprio
sudo docker network rm hadoop-net-1to2prio
sudo docker network rm hadoop-net-1to3prio
sudo docker network rm hadoop-net-2to1prio
sudo docker network rm hadoop-net-2to2prio
sudo docker network rm hadoop-net-3to1prio
