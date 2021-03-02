#!/usr/bin/env bash

#http://httpd.apache.org/docs/2.2/programs/ab.html
#https://hub.docker.com/r/jordi/ab

#Test:
# 1. docker run -d --network=host jordi/server:http
# 2. ab 10 100000 http://172.17.0.1:8080/

#set -x

CONCURRENCY=$1
REQUESTS=$2
URL=$3

docker run --network=host --rm jordi/ab -k -c "$CONCURRENCY" -n "$REQUESTS" --network=host "$URL"
