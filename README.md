# Docker image for *Hey Djoe !* 

Main repository: https://github.com/remipassmoilesel/djoe

## Why Docker ?

Docker allow you to install and run the entire project with a few commands:

```

    # /!\ Need Docker, see https://docs.docker.com/engine/installation/
    
    $ git clone https://github.com/remipassmoilesel/djoe-docker
    $ cd djoe-docker
    $ ./build-and-launch.sh

```

This produce an *example* installation with:

* Apache HTTP with a simple TLS configuration
* XMPP server
* Etherpad 
* Postgres database
* Statistics server

Tested only on Ubuntu 16.04 LTS

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

## Why put an Apache proxy in Dockerfile ?

Unfortunately, some functionnalities are disabled if XMPP client is loaded in a non secure environment.
In order to allow to test client full-featured, the Apache proxy is compulsory.