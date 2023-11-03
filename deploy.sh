#!/bin/bash

# This script is used to deploy the gokart docker image to the Raspberry Pi
# check if the docker image exists
if [[ "$(docker images -q electric-go-kart 2> /dev/null)" == "" ]]; then
  # if the image does not exist, build it
  echo "Building docker image..."
  docker build -t electric-go-kart .
fi 
# else, the image exists, so we can deploy it
echo "Deploying docker image..."
docker run --privileged -it --rm --net=host --name electric-go-kart electric-go-kart

# EOF