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
