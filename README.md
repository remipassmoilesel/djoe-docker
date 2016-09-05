# Dockerfile in progress

Not working for now.

## Why Docker ?

Docker allow you to install and run the entire project with a few commands:

```
    $ docker build docker/ -t heydjoe
    $ docker run -ti heydjoe 
    
    # or 
    
    $ ./build-and-launch.sh
     
```

Configuration available in `djoe-docker-config.sh`