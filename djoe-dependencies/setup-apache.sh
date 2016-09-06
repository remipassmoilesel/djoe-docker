#!/bin/bash

# Apache setup
# Apache can be set up with non certified keys or with provided keys

# get configuration
source ../djoe-docker-config.sh

# verbose if needed
if [ $DJOE_DEBUG_MODE = true ] ; then
  set -x
fi

function setupNonCertifiedKeys {

  # Generate keys
  cd /etc/ssl
  openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=AA/ST=BB/L=CC/O=DD/CN=EE" \
    -keyout djoe.key -out djoe.crt

}

function setupCertifiedKeys {
  echo "Setup with certified keys not implemented for now"

  # Copy keys to /etc/ssl
  # DJOE_SSL_KEY="djoe.key"
  # DJOE_SSL_CERT="djoe.crt"

  exit 1
}

# activate Apache2 needed modules
a2enmod ssl rewrite proxy proxy_http headers

# setup keys
if [ $DJOE_USE_NON_CERTIF_KEYS = true ] ; then
  setupNonCertifiedKeys
else
  setupCertifiedKeys
fi

# remove uneeded configurations
rm /etc/apache2/sites-available/*
rm /etc/apache2/sites-enabled/*

# add new configuration file
cp /opt/djoe-project/etc/apache2/sites-available/djoe-docker.conf /etc/apache2/sites-available/djoe-docker.conf
a2ensite djoe-docker.conf

# link needed directories
ln -s /opt/djoe-project/var/www/djoe/ /var/www/djoe