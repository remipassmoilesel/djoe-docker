#!/bin/bash

# Setup POSTGRES database

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

sudo service postgresql start

sudo -u postgres psql -c 'create database "openfire"'
sudo -u postgres psql -c 'create database "Stats"'

