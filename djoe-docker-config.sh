#!/bin/bash

# Configuration for Djoe Docker image building

#
# /!\ All parameters are COMPULSORY
#
# No TURN servers are provided so if you want try videoconference in 'real world' you have to
# modify djoe-dependencies/turnCredentials.json and add your credentials
#

# XMPP domain, a name representing an XMPP ~"network"~
DJOE_XMPP_DOMAIN="heydjoe.xmpp"

# HTTP domain, where whole installation can be reached
DJOE_HTTP_DOMAIN="www.heydjoe.domain"

# If set to true, non certified TLS keys will be created, and behavior of demo website will
# be adapted. Otherwise you will have to specify where are keys
#DJOE_USE_NON_CERTIF_KEYS=false
DJOE_USE_NON_CERTIF_KEYS=true

# Path of TLS keys, relative to the main Dockerfile directory ($DJOE_GIT_ROOT/opt/docker-djoe/)
# If option DJOE_USE_NON_CERTIF_KEYS is enabled, these paths will not be used
# Not tested for now
DJOE_SSL_KEY="djoe.key"
DJOE_SSL_CERT="djoe.crt"

# If set to true, verbosity will be increased
#DJOE_DEBUG_MODE=false
DJOE_DEBUG_MODE=true

# If set to false, some dependencies will not be downloaded. This is usefull only for debug purposes.
# If download is turned off, you have to place dependencies in djoe-dendencies folder like that:
#    .
#    ├── djoe-dependencies
#    │   ├── djoe-project           // djoe repository cloned with Git
#    │   ├── etherpad-lite          // etherpad-lite repository cloned with Git
#    │   ├── web-stats              // web-stats repository cloned with Git
#    │   ├── nodejs4.tar.gz
#    │   ├── openfire.tar.gz
#    │   └── ...
#    └── ...
# And uncomment some lines in Dockerfile:
#   Only for debug purposes, to avoid too many downloads
#   ADD djoe-dependencies/djoe-project/ /opt/djoe-project/
#   ADD djoe-dependencies/etherpad-lite/ /opt/etherpad-lite/
#   ADD djoe-dependencies/web-stats/ /opt/web-stats/
#
# Think to disable .Dockerignore too
#
# Even if download is turned off, some dependencies have to be downloaded.
#

DJOE_DOWNLOAD_DEPENDENCIES=true
#DJOE_DOWNLOAD_DEPENDENCIES=false
