#!/bin/sh

# Pull the K6 Container
docker pull loadimpact/k6

# Set access
chmod 700 thesis-measurements.pem

# Start the In-Memory Benchmark
ssh -i "aws-thesis-machines.pem" ubuntu@3.13.175.205 << EOF
  sudo docker run -d --rm --volumes-from inmemorydataweb1 --name inmemorybenchmarkweb11 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
EOF

# Start the K6 Container
docker run -i loadimpact/k6 run --out influxdb=http://admin:os234guivahdf1a@5.189.144.254:8086/inMemory1 --vus 100 --duration 30s - <k6requests/requests.js
