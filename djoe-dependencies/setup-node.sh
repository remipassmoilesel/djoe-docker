#!/bin/bash

# NodeJS 4 setup

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

export PATH=$PATH:/opt/nodejs4/bin/

# Install bower
npm install -g bower
