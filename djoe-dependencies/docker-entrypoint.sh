#!/bin/bash

echo
echo
echo Launch can take long time, please be patient ....
echo Launch can take long time, please be patient ....
echo Launch can take long time, please be patient ....
echo Launch can take long time, please be patient ....
echo Launch can take long time, please be patient ....
echo Launch can take long time, please be patient ....
echo Launch can take long time, please be patient ....
echo
echo

echo
echo Used configuration:
echo

cat /opt/djoe-docker-config.sh

echo
echo TURN credentials:
echo

cat /opt/djoe-dependencies/turnCredentials.json


export PATH=$PATH:/opt/nodejs4/bin/

echo
echo Starting PostgreSQL
echo

sudo service postgresql start

echo
echo Starting Openfire
echo

/opt/openfire/bin/openfire start

echo
echo Starting Etherpad
echo

/opt/etherpad-lite/bin/run.sh --root &

echo
echo Starting Stats
echo

cd /opt/web-stats/server/
node server.js &

echo
echo Starting Apache2
echo

# Startup Apache2 in foreground
apachectl -D FOREGROUND


