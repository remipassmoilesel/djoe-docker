#!/bin/bash

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

cd /opt/web-stats

npm install

cd public
bower install --allow-root
