#!/usr/bin/env bash

#set -x

CONCURRENCY=$1
REQUESTS=$2

docker run --rm jordi/ab -k -c "$CONCURRENCY" -n "$REQUESTS" http://172.17.0.1:8080/
