#!/bin/bash

echo
echo "Launch can take long time, please be patient ...."
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

# Build final image
IMAGE_ID="heydjoe"

#EXPOSE 22 80 3000 3005 7070 9001 9090 9091
CTR_ID=`docker run -d -p 22:22 -p 80:80 -p 3000:3000 -p 7070:7070 -p 9001:9001 -p 9090:9090 "$IMAGE_ID"`

sleep 3

echo
echo "Container ID: "
echo "$CTR_ID"

echo
echo "Container launching completed. Container listenning adress: "
docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$CTR_ID"

echo
echo "To get more informations, try: docker inspect $CTR_ID"


