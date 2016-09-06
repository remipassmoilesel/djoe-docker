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

# Create needed databases
sudo -u postgres psql -c 'create database "openfire"'
sudo -u postgres psql -c 'create database "Stats"'

