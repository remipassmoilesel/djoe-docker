#!/bin/bash

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

cp /opt/djoe-project/opt/etherpad-lite/settings.json /opt/etherpad-lite/settings.json
