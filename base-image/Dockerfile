# Base image for Djoe.
# Allow to install APT dependencies only once.

# $ docker build base-image -t djoe_ubuntu_prepared

FROM ubuntu:16.04
MAINTAINER remipassmoilesel
LABEL name="djoe_ubuntu_prepared"

# Update system
RUN echo "Run APT update && installation ..." && echo
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y \
    && apt-get -y install apache2 curl openjdk-8-jre-headless sudo postgresql wget \
    && apt-get -y install git openssh-server xz-utils openssl
#    && apt-get -y install tree vim ranger # dev dependencies
