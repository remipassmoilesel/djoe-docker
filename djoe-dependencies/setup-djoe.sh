#!/bin/bash

# Djoe setup

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

export PATH=$PATH:/opt/nodejs4/bin/

cd /opt/djoe-project/var/www/djoe/

# Install submodules
git submodule init
git submodule update

# Install demo page dependencies
bower install --allow-root







