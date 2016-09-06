
# $ docker build . -t heydjoe

FROM djoe_ubuntu_prepared:latest
MAINTAINER remipassmoilesel
LABEL name="Hey Djoe !" description="All you need for instant messaging :)"

# Add configuration files
ADD djoe-docker-config.sh /opt/djoe-docker-config.sh
RUN chmod +x /opt/djoe-docker-config.sh

ADD djoe-dependencies/ /opt/djoe-dependencies/

# Only for debug purposes, to avoid too many downloads
ADD djoe-dependencies/djoe-project/ /opt/djoe-project/
ADD djoe-dependencies/etherpad-lite/ /opt/etherpad-lite/
ADD djoe-dependencies/web-stats/ /opt/web-stats/

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

# Configure Apache
RUN cd /opt/djoe-dependencies \
    && chmod +x setup-apache.sh && sync && ./setup-apache.sh

# Configure Postgres
RUN cd /opt/djoe-dependencies \
    && chmod +x setup-postgres.sh && sync && ./setup-postgres.sh

# Configure Etherpad
RUN cd /opt/djoe-dependencies \
    && chmod +x setup-etherpad.sh && sync && ./setup-etherpad.sh

# Configure Openfire
RUN cd /opt/djoe-dependencies \
    && chmod +x setup-openfire.sh && sync && ./setup-openfire.sh

# Configure Stats module
RUN cd /opt/djoe-dependencies \
    && chmod +x setup-webstats.sh && sync && ./setup-webstats.sh

# Show trees, for debug purposes
RUN cd /opt && tree -L 3
RUN cd /etc/apache2 && tree -L 2

# Configure docker entrypoint
RUN cp /opt/djoe-dependencies/docker-entrypoint.sh /opt/docker-entrypoint.sh && sync && chmod +x /opt/docker-entrypoint.sh
ENTRYPOINT /opt/docker-entrypoint.sh

EXPOSE 80 443 3000 3005 7070 9001 9090 9091



