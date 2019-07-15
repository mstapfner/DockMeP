#!/bin/sh
set -e

# Sudo not needed (because on private VM)

# Pull the K6 Container
docker pull loadimpact/k6

# Start the K6 Container
docker run -i loadimpact/k6 run --out influxdb=http://admin:os234guivahdf1a@5.189.144.254:8086/remoteInstance --vus 100 --duration 30s - <k6requests/requests.js
