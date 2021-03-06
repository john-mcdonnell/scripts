#!/usr/bin/env bash

#https://howchoo.com/bitcoin/mine-bitcoin-on-your-laptop-with-docker#start-mining/

#set -x

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi

CPUS=${1:-.5}
WORKER_NUMBER=${2:-1}
CONTAINER_NAME=${3:-miner}
IMAGE_NAME=${4:-kmdgeek/nheqminer}
IMAGE_TAG=${5:-latest}
NICE_HASH_USER=${6:-3FQ3Qv4XsY7ADzbCH8tUBZZhp9YMek5DiF}
NICE_HASH_LOCATION=${7:-equihash.usa.nicehash.com:3357}

[ "$(docker ps | grep --count miner)" -eq 1 ] && docker rm --force "$CONTAINER_NAME"
docker run --rm --detach \
  --cpus="$CPUS" \
  --name "$CONTAINER_NAME" \
  "$IMAGE_NAME":"$IMAGE_TAG" \
  /nheqminer \
  -l "$NICE_HASH_LOCATION" \
  -u "$NICE_HASH_USER".worker."$WORKER_NUMBER"
docker logs -f "$CONTAINER_NAME"
