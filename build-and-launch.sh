#!/bin/bash

echo
echo "Build and launch can take long time, please be patient ...."
echo

sleep 3

echo
echo Used configuration:
echo

cat djoe-docker-config.sh

echo
echo TURN credentials:
echo

cat djoe-dependencies/turnCredentials.json


echo
echo "Building Docker images ..."
echo
echo "WORK IN PROGRESS, NOT READY FOR NOW"
echo "WORK IN PROGRESS, NOT READY FOR NOW"
echo "WORK IN PROGRESS, NOT READY FOR NOW"
echo
echo
echo

# Build base image with APT dependencies

docker build -t "djoe_ubuntu_prepared" base-image

if [ $? != 0 ]; then
  echo
  echo "Error while building Docker image"
  exit 1
fi

# Build final image
IMAGE_ID="docker-djoe"

docker build -t "$IMAGE_ID" .

if [ $? != 0 ]; then
  echo
  echo "Error while building Docker image"
  exit 1
fi

echo 
echo "Launching container ..."
echo

#CTR_ID=`docker run -d "$IMAGE_ID"`
CTR_ID=`docker run -ti -d "$IMAGE_ID"`

echo
echo "Container ID: "
echo "$CTR_ID"

sleep 1

echo
echo "Informations on container: "
docker inspect "$CTR_ID"

