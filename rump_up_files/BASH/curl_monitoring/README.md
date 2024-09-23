# Nginx Proxy Server in Ubuntu Container with Bash Monitoring

## Overview

This project demonstrates how to create a simple Nginx proxy server running inside an Ubuntu Docker container and how to monitor its availability using a Bash script with `curl`. The goal is to set up a basic Nginx web proxy and continuously check its status to ensure it is functioning properly.

## Project Structure

- **Dockerfile**: Defines the Docker container that installs and runs Nginx on an Ubuntu base image.
- **monitor_nginx.sh**: A Bash script that uses `curl` to monitor the status of the Nginx proxy by checking the HTTP response code.
  
## Features

- **Nginx Proxy Server**: The project builds an Nginx proxy server that listens on port 8080 of the host machine, forwarding requests internally within the Docker container on port 80.
- **Monitoring Script**: The monitoring script checks the server status at regular intervals (default: 5 seconds). If the server is down or not responding, it prints a message indicating the failure.

## Setup Instructions

### Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your system.
- Basic knowledge of Bash scripting and Docker.

### Step 1: Build the Docker Image

First, clone this repository or create the files manually. Then, build the Docker image from the provided `Dockerfile`:

```bash
docker build -t my-nginx-proxy .
```

### Step 2: Run the Docker Container

Run the Docker container, exposing the container’s port 80 to the host machine’s port 8080:


```bash
docker run -d -p 8080:80 --name nginx-proxy my-nginx-proxy
```

The Nginx server should now be running and accessible via `http://localhost:8080`.

### Step 3: Monitoring Nginx Server

To monitor the availability of the Nginx proxy, use the provided Bash script monitor_nginx.sh. Make the script executable and then run it:

```bash
chmod +x monitor_nginx.sh
./monitor_nginx.sh
```

The script will continuously check if the Nginx proxy server is responding with an HTTP 200 OK status. If the server is down, the script will log a message with a timestamp.


### Files

- Dockerfile: A Docker configuration file that installs and configures Nginx in a lightweight Ubuntu environment.

- monitor_nginx.sh: A simple Bash script for monitoring the status of the Nginx proxy using `curl`.

### `Dockerfile`

This file defines the steps to create a Docker image with Ubuntu and Nginx installed.

```Dockerfile
# Use the official Ubuntu base image
FROM ubuntu:latest

# Update packages and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Expose port 80 for accessing the server
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
```

### `monitor_nginx.sh:`

A simple Bash script that monitors the Nginx server status by sending requests to `http://localhost:8080`.

```bash
#!/bin/bash

# URL of the Nginx proxy server
URL="http://localhost:8080"

# Interval between checks in seconds
INTERVAL=5

while true; do
    # Use curl to check the status of the server
    HTTP_RESPONSE=$(curl --write-out "%{http_code}" --silent --output /dev/null "$URL")

    # Check if the server responds with HTTP 200
    if [ "$HTTP_RESPONSE" -eq 200 ]; then
        echo "$(date): Nginx Proxy Server is running. Status code: $HTTP_RESPONSE"
    else
        echo "$(date): Nginx Proxy Server is down. Status code: $HTTP_RESPONSE"
    fi

    # Wait before the next check
    sleep $INTERVAL
done

```
<p align="left">
 <img width="800px" src="/rump_up_files/BASH/curl_monitoring/curl1.png" alt="qr"/>
</p>

<p align="left">
 <img width="800px" src="/rump_up_files/BASH/curl_monitoring/curl2.png" alt="qr"/>
</p>

<p align="left">
 <img width="800px" src="/rump_up_files/BASH/curl_monitoring/curl3.png" alt="qr"/>
</p>