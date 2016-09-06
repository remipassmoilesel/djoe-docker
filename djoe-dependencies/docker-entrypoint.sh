#!/bin/bash

export PATH=$PATH:/opt/nodejs4/bin/

# Startup Openfire
/opt/openfire/bin/openfire start

# Startup Etherpad in background
/opt/etherpad-lite/bin/run.sh --root &

# Startup stats module in background
node /opt/web-stats/server/server.js &

# Startup Apache2 in foreground
apachectl -D FOREGROUND


