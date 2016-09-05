#!/bin/bash

# Startup Openfire
/opt/openfire/bin/openfire start

# Startup Etherpad in background
export PATH=$PATH:/opt/node/bin/
/opt/etherpad-lite/bin/run.sh --root &

# Startup Apache2 in foreground
apachectl -D FOREGROUND


