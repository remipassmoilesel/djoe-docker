#!/bin/bash

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

# Configure Openfire
cp /opt/djoe-project/opt/openfire/conf/openfire.xml /opt/openfire/conf/openfire.xml
