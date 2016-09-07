#!/bin/bash

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

export PATH=$PATH:/opt/nodejs4/bin/

# Install dependencies
cd /opt/web-stats

npm install

cd public

bower install --allow-root


