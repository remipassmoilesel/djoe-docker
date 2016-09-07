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
IMAGE_ID="heydjoe"

docker build -t "$IMAGE_ID" .

if [ $? != 0 ]; then
  echo
  echo "Error while building Docker image"
  exit 1
fi

echo 
echo "Launching container ..."
echo

CTR_ID=`docker run -d -p 80:80 -p 443:443 "$IMAGE_ID"`

sleep 3

echo
echo "Container ID: "
echo "$CTR_ID"

echo
echo "Container launching completed. Container listenning adress: "
docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$CTR_ID"

echo
echo "To get more informations, try: docker inspect $CTR_ID"


