
FROM ubuntuprepared:latest

#FROM ubuntu:16.04
#MAINTAINER remipassmoilesel
#LABEL name="Hey Djoe !" description="All you need for instant messaging :)"
#

#
## Only for debug purposes
#ADD djoe-project/ /opt/djoe-project/
#
## Display configuration
#RUN /bin/bash -x /opt/djoe-docker-config.sh
#
## Update system
#RUN echo "Run APT update && installation ..." && echo
#RUN apt-get update \
#    && apt-get -y install apache2 postgresql wget \
#    && apt-get -y install git openssh-server xz-utils openssl \
#    && apt-get -y install tree # dev dependencies

# Add configuration file to system
ADD djoe-docker-config.sh /opt/djoe-docker-config.sh
ADD djoe-dependencies/ /opt/djoe-dependencies/

# Only for debug purposes, normally project have to be clone with GIT in setup-djoe.conf
ADD djoe-project/ /opt/djoe-project/

# Download dependencies only if necessary (see config.sh)
# and extract them
RUN echo "Download and extract dependencies ..." && echo

RUN cd /opt/djoe-dependencies \
    && chmod +x get-dependencies.sh && sync && ./get-dependencies.sh

# Setup NodeJS
RUN cd /opt/djoe-dependencies \
    && chmod +x setup-node.sh && sync && ./setup-node.sh

# Setup XMPP client and configuration files
RUN echo "Download and setup Djoe ..." && echo
RUN cd /opt/djoe-dependencies \
    && chmod +x setup-djoe.sh && sync && ./setup-djoe.sh

# Show tree
RUN cd /opt && tree -L 3

# Configure Apache
RUN cd /opt/djoe-dependencies \
    && chmod +x setup-apache.sh && sync && ./setup-apache.sh

ENTRYPOINT /opt/docker-entrypoint.sh

EXPOSE 80 443



#
## installer node et etherpad
#RUN cd opt/ \
#    && git clone https://github.com/ether/etherpad-lite/ \
#    && wget https://nodejs.org/dist/v4.4.4/node-v4.4.4-linux-x64.tar.xz \
#    && tar -xf node-v4.4.4-linux-x64.tar.xz \
#    && mv node-v4.4.4-linux-x64 node
#
#ADD opt.etherpad.settings.json /opt/etherpad/settings.json
#
## fichier de lancement des serveurs
#ADD opt.docker-entrypoint.sh /opt/docker-entrypoint.sh
#RUN chmod +x /opt/docker-entrypoint.sh
#
## Le script lancé au démarrage du conteneur

#
## ouvrir les ports nécéssaires
#EXPOSE 80 7070 9090 9091 9001



