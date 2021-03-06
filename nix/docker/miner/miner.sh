#!/usr/bin/env bash

#https://howchoo.com/bitcoin/mine-bitcoin-on-your-laptop-with-docker#start-mining/

CONTAINER_TOTAL=$1

docker service ps miner >/dev/null 2>&1

if [[ $? -eq 1 ]]; then
  docker service create \
    --name miner \
    alexellis2/cpu-opt:2018-1-2 \
    ./cpuminer \
    -a cryptonight \
    -o stratum+tcp://cryptonight.usa.nicehash.com:3355 \
    -u 3HSFKUagtL5Z6KFE7gAJ3i9YgWkmaKH6Zb.miner1
else
  docker service scale miner="$CONTAINER_TOTAL"
fi

docker service logs -f miner
