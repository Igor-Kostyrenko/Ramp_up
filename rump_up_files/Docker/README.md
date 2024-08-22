<p align="left">
 <img width="600px" src="/img/docker-logo.png" alt="qr"/>
</p>


### This [Dockerfile](./Dockerfile) will set up an nginx service managed by daemontools with logging handled by multilog, all within a Debian 11-based container.

```sh
    # Use Debian 11 as the base image
FROM debian:11

# Update the system and install required packages
RUN apt-get update && \
    apt-get install -y \
    daemontools \
    nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create directories for the nginx service and logs, managed by daemontools
RUN mkdir -p /etc/service/nginx /etc/service/nginx/log /var/log/nginx

# Create the run file for the nginx service
RUN echo '#!/bin/sh' > /etc/service/nginx/run && \
    echo 'exec nginx -g "daemon off;"' >> /etc/service/nginx/run && \
    chmod +x /etc/service/nginx/run

# Create the run file for multilog to manage nginx logs
RUN echo '#!/bin/sh' > /etc/service/nginx/log/run && \
    echo 'exec multilog t s100000 /var/log/nginx' >> /etc/service/nginx/log/run && \
    chmod +x /etc/service/nginx/log/run

# Use svscan to manage services under /etc/service
CMD ["svscan", "/etc/service"]
```

1. Starting Services with svscan
#### `svscan` is the command that monitors a directory of services and starts each service that it finds.