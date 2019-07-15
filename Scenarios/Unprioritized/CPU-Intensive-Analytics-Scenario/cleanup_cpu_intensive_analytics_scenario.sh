#!/bin/sh

# Delete all containers
sudo docker rm twitterdata
sudo docker rm hadoopmastersingle
sudo docker rm hadoopslave01single
sudo docker rm graphanalyticsingle
# 1 to 2 Scenatio
sudo docker rm twitterdata1to2
sudo docker rm hadoopmaster1to2
sudo docker rm graphanalytic1to21
sudo docker rm hadoopslave1to21
sudo docker rm hadoopslave1to22
# 1 to 3 Scenario
sudo docker rm twitterdata1to3
sudo docker rm hadoopmaster1to3
sudo docker rm graphanalytic1to3
sudo docker rm hadoopslave1to31
sudo docker rm hadoopslave1to32
sudo docker rm hadoopslave1to33
# 2 to 1 Scenario
sudo docker rm hadoopmaster2to1
sudo docker rm twitterdata2to1
sudo docker rm graphanalytic2to11
sudo docker rm graphanalytic2to12
sudo docker rm hadoopslave2to11
# 2 to 2 Scenario
sudo docker rm twitterdata2to2
sudo docker rm hadoopmaster2to2
sudo docker rm graphanalytic2to2
sudo docker rm graphanalytic2to2
sudo docker rm hadoopslave2to21
sudo docker rm hadoopslave2to22
# 3 to 1 Scenario
sudo docker rm twitterdata3to1
sudo docker rm hadoopmaster3to1
sudo docker rm graphanalytic3to11
sudo docker rm graphanalytic3to12
sudo docker rm graphanalytic3to13
sudo docker rm hadoopslave013to1

# Delete all images
sudo docker rmi cloudsuite/hadoop
sudo docker rmi cloudsuite/data-analytics
sudo docker rmi cloudsuite/graph-analytics
sudo docker rmi cloudsuite/twitter-dataset-graph

# Delete all Networks
sudo docker network rm hadoop-net-single
sudo docker network rm hadoop-net-1to2
sudo docker network rm hadoop-net-1to3
sudo docker network rm hadoop-net-2to1
sudo docker network rm hadoop-net-2to2
sudo docker network rm hadoop-net-3to1
