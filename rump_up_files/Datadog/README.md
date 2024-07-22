<p align="left">
 <img width="400px" src="dd_logo.jpg" alt="qr"/>
</p>

# Nginx and Datadog Integration with Custom Agent Check

This project sets up Nginx and Datadog Agent using Docker Compose and includes a custom Datadog Agent check to monitor the status of an Nginx server.

## Dependencies

- Docker
- Docker Compose

## Files Description

### `docker-compose.yml`

This file defines the Docker services for Nginx and Datadog Agent. It includes volume mounts for the Nginx configuration and custom Datadog checks.

### `nginx_check.py`

A custom Datadog Agent check script. This script checks the availability of the Nginx status page and the main page, reporting the HTTP status code as a metric and the availability as a service check.

### `nginx_check.yaml`

The configuration file for the custom Datadog check. It specifies the URLs to be monitored.

### `nginx.conf`

The Nginx configuration file. It includes settings to enable the Nginx status page.

## Setup and Configuration

1. **Clone this repository**

2. **Update your `DD_API_KEY` in `docker-compose.yml`**

2. **Update your `YOUR-HOST-IP` in `nginx_check.yml`**

4. **Run all containers with `docker-compose up -d`**