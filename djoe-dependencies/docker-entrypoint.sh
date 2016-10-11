#!/bin/bash

export PATH=$PATH:/opt/nodejs4/bin/

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

echo
echo Starting OpenSSH
echo

service ssh start

echo
echo Starting PostgreSQL
echo

service postgresql start

echo
echo Starting Openfire
echo

# always stop before, sometimes Openfire can have trouble
/opt/openfire/bin/openfire stop
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


