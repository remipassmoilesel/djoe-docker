#!/bin/bash

# Apache setup
# Apache can be set up with non certified keys or with provided keys

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

# remove uneeded configurations
rm /etc/apache2/sites-available/*
rm /etc/apache2/sites-enabled/*

# add new configuration file
cp /opt/djoe-dependencies/apache-virtualhost.conf /etc/apache2/sites-available/djoe-docker.conf

a2ensite djoe-docker.conf

# link needed directories
ln -s /opt/djoe-project/var/www/djoe/ /var/www/djoe