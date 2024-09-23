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
