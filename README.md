# Docker image for *Hey Djoe !* 

## Presentation

A small video is available on Youtube: https://youtu.be/AhwIXTTs5ao
Main repository: https://github.com/remipassmoilesel/heydjoe

## Why Docker ?

Docker allow you to install and run the entire project with a few commands:

```

    # /!\ Need Docker, see https://docs.docker.com/engine/installation/
    
    $ git clone https://github.com/remipassmoilesel/djoe-docker
    $ cd djoe-docker
    $ ./build-image.sh
    $ ./launch-new-container.sh

```

This produce an *example* installation with:

* Apache HTTP server
* XMPP server
* Etherpad 
* Postgres database
* Statistics server

After you need to setup a TLS proxy, for example with Apache:

```
    Listen 80
    Listen 443
    ServerSignature Off
    ServerTokens Prod
    
    <VirtualHost *:443>
    
      ServerName heydjoe.ddns.net
    
      LogLevel alert
    
      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
    
      SSLEngine on
      SSLCertificateFile      /etc/ssl/vps.crt
      SSLCertificateKeyFile   /etc/ssl/vps.key
    
      RewriteEngine on
    
      ProxyVia On
      ProxyRequests Off
      ProxyPreserveHost On
    
      ProxyPass /etherpad/p/ http://localhost:29001/p/
      ProxyPassReverse /etherpad/p/ http://localhost:29001/p/
    
      ProxyPass /etherpad/ http://localhost:29001/
      ProxyPassReverse /etherpad/ http://localhost:29001/
    
      RewriteRule ^/openfire-rest/(.*) http://localhost:29090/plugins/restapi/v1/$1 [P,L]
      ProxyPassReverse /openfire-rest/  http://localhost:29090/plugins/restapi/v1/
    
      ProxyPass /stats http://localhost:23000
      ProxyPassReverse /stats http://localhost:23000
    
      ProxyPass /stats/visualization http://localhost:23000/visualization
      ProxyPassReverse /stats/visualization http://localhost:23000/visualization
    
      ProxyPass / http://localhost:20080/
      ProxyPassReverse / http://localhost:20080/
    
    </VirtualHost>
    
```

Need an external TURN server, credentials can be modified in Docker image configuration.

## Before launch

First you have to adapt configuration by editing `djoe-docker-config.sh`

Then you have to set up a network. A good solution is to set a local network, and to patch `/etc/hosts` of each computer like that:
 
```

    # As root, with the right IP adress of the Docker host computer
    # echo "192.168.1.36     www.heydjoe.domain" >> /etc/hosts
    
```

After that you can visit `www.heydjoe.domain` with your favorite browser.

## Multimedia in real world

If you want to test videoconference in *real world* you will have to use a TURN server, not provided here. 

TURN server credentials can be inserted in `djoe-dependencies/turnCrednetials.json`

## What is the status of this project?

Djoe is an internship project writted in few months, currently in alpha version. In its current state it is usable but it 
requires a bit of work to be improved and fully operational. 
