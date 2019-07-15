#!/bin/sh

# Pull the K6 Container
docker pull loadimpact/k6

# Start the In-Memory Benchmark
ssh -i "aws-thesis-machines.pem" ubuntu@3.13.175.205 << EOF
  sudo docker run -d --rm --volumes-from inmemorydataweb3 --name inmemorybenchmarkweb31 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
  sudo docker run -d --rm --volumes-from inmemorydataweb3 --name inmemorybenchmarkweb32 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv &
  sudo docker run -d --rm --volumes-from inmemorydataweb3 --name inmemorybenchmarkweb33 cloudsuite/in-memory-analytics /data/ml-latest-small /data/myratings.csv
EOF

# Start the K6 Container
docker run -i loadimpact/k6 run --out influxdb=http://admin:os234guivahdf1a@5.189.144.254:8086/inMemory3 --vus 100 --duration 30s - <k6requests/requests.js
