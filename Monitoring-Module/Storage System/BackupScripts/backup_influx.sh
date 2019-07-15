#!/bin/sh
set -e

# Has to be executed on the Remote Monitoring Machine

# Backup of remoteInstance Database
docker exec influxdb influxd backup -database remoteInstance "/backup/remoteInstance.backup"
# Backup of Web-Graph databases
docker exec influxdb influxd backup -database webgraph1 "/backup/webgraph1.backup"
docker exec influxdb influxd backup -database webgraph2 "/backup/webgraph2.backup"
docker exec influxdb influxd backup -database webgraph3 "/backup/webgraph3.backup"
# Backup of Web-In-Memory databases
docker exec influxdb influxd backup -database inMemory1 "/backup/inMemory1.backup"
docker exec influxdb influxd backup -database inMemory2 "/backup/inMemory2.backup"
docker exec influxdb influxd backup -database inMemory3 "/backup/inMemory3.backup"

# Backup of remoteInstance Database
docker exec influxdb influxd backup -database remoteInstanceprio "/backup/remoteInstanceprio.backup"
# Backup of Web-Graph databases
docker exec influxdb influxd backup -database webgraph1prio "/backup/webgraph1prio.backup"
docker exec influxdb influxd backup -database webgraph2prio "/backup/webgraph2prio.backup"
docker exec influxdb influxd backup -database webgraph3prio "/backup/webgraph3prio.backup"
# Backup of Web-In-Memory databases
docker exec influxdb influxd backup -database inMemory1prio "/backup/inMemory1prio.backup"
docker exec influxdb influxd backup -database inMemory2prio "/backup/inMemory2prio.backup"
docker exec influxdb influxd backup -database inMemory3prio "/backup/inMemory3prio.backup"

# Copy the backup folder from the container in the local file system
docker cp influxdb:/backup ./backup
