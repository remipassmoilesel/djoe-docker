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

# modify stats configuration
sed -i "s/{{%%HTTP-DOMAIN%%}}/$DJOE_HTTP_DOMAIN/g" /opt/djoe-dependencies/webstats_config.js
sed -i "s/{{%%XMPP-DOMAIN%%}}/$DJOE_XMPP_DOMAIN/g" /opt/djoe-dependencies/webstats_config.js
cp /opt/djoe-dependencies/webstats_config.js /opt/web-stats/configuration.js
