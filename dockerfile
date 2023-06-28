# Pull the minimal Ubuntu image
FROM ubuntu

# Install Nginx
RUN sudo apt-get -y update && apt-get -y install nginx

# Copy the Nginx config
COPY default /etc/nginx/sites-available/default

COPY  docker-nginx/html/index.html /usr/share/nginx/html/index.html

# Expose the port for access
EXPOSE 80/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
