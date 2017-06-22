#!/bin/bash

# Setup POSTGRES database

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

# Start servers in order to crate databases
sudo service postgresql start

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres'; ";

# Setup Openfire configuration database
sed -i "s/{{%%HTTP-DOMAIN%%}}/$DJOE_HTTP_DOMAIN/g" /opt/djoe-dependencies/openfire_config.sql
sed -i "s/{{%%XMPP-DOMAIN%%}}/$DJOE_XMPP_DOMAIN/g" /opt/djoe-dependencies/openfire_config.sql
sed -i "s/{{%%OPENFIRE-REST-API-KEY%%}}/$OPENFIRE_REST_API_KEY/g" /opt/djoe-dependencies/openfire_config.sql
sudo -u postgres psql -c 'create database "openfire"'
sudo -u postgres psql openfire < /opt/djoe-dependencies/openfire_config.sql

# Setup Stats database
sudo -u postgres psql -c 'create database "Stats"'

# Setup Etherpad database
sudo -u postgres psql -c 'create database "etherpad"'
