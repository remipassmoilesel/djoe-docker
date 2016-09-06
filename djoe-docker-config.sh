#!/bin/bash

# Configuration for Djoe Docker image building

#
# /!\ All parameters are COMPULSORY
#
# No TURN servers are provided so if you want try videoconference in 'real world' you have to
# modify djoe-dependencies/turnCredentials.json and add your credentials
#

# XMPP domain, a name representing an XMPP ~~"network"
DJOE_XMPP_DOMAIN="im.silverpeas.net"

# HTTP domain, where whole installation can be reached
DJOE_HTTP_DOMAIN="172.17.0.2"

# If set to true, non certified TLS keys will be created, and behavior of demo website will
# be adapted. Otherwise you will have to specify where are keys
#DJOE_USE_NON_CERTIF_KEYS=false
DJOE_USE_NON_CERTIF_KEYS=true

# Path of TLS keys, relative to the main Dockerfile directory ($DJOE_GIT_ROOT/opt/docker-djoe/)
# If option DJOE_USE_NON_CERTIF_KEYS is enabled, these paths will not be used

# NOT EFFECTIVE FOR NOW
# NOT EFFECTIVE FOR NOW
# NOT EFFECTIVE FOR NOW

DJOE_SSL_KEY="djoe.key"
DJOE_SSL_CERT="djoe.crt"

# If set to true, verbosity will be increased
#DJOE_DEBUG_MODE=false
DJOE_DEBUG_MODE=true

# If set to true, dependencies will be downloaded
#DJOE_DOWNLOAD_DEPENDENCIES=true
DJOE_DOWNLOAD_DEPENDENCIES=false
