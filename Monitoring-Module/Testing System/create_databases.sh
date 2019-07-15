#!/bin/sh

# Create Database for the CPU and In-Memory Benchmarks
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "remoteInstance"'
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "remoteInstanceprio"'

# Create Databases for Web-Graph-Benchmarks
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "webgraph1"'
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "webgraph2"'
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "webgraph3"'

# Create Databases for Web-InMemory-Benchmarks
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "inMemory1"'
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "inMemory2"'
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "inMemory3"'

# Create Databases for Web-Graph-Benchmarks
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "webgraph1prio"'
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "webgraph2prio"'
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "webgraph3prio"'

# Create Databases for Web-InMemory-Benchmarks
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "inMemory1prio"'
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "inMemory2prio"'
curl -XPOST 'http://admin:os234guivahdf1a@5.189.144.254:8086/query' --data-urlencode 'q=CREATE DATABASE "inMemory3prio"'
