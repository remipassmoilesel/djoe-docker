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

# modify TURN credentials
cp /opt/djoe-dependencies/turnCredentials.json /opt/djoe-project/var/www/djoe/

# modify XMPP client init  and {{%%XMPP-DOMAIN%%}}
sed -i "s/{{%%HTTP-DOMAIN%%}}/$DJOE_HTTP_DOMAIN/g" /opt/djoe-dependencies/jsxc_init.js
sed -i "s/{{%%XMPP-DOMAIN%%}}/$DJOE_XMPP_DOMAIN/g" /opt/djoe-dependencies/jsxc_init.js
sed -i "s/{{%%OPENFIRE-REST-API-KEY%%}}/$OPENFIRE_REST_API_KEY/g" /opt/djoe-dependencies/jsxc_init.js

cp /opt/djoe-dependencies/jsxc_init.js /opt/djoe-project/var/www/djoe/jsxc/build
cp /opt/djoe-dependencies/jsxc_init.js /opt/djoe-project/var/www/djoe/jsxc/dev





