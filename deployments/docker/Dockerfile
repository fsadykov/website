# Use the nginx image as a base
FROM --platform=linux/amd64 nginx:latest

# Copy the website's HTML code into nginx's HTML directory
COPY ./app /usr/share/nginx/html

# Expose the port nginx is setup on and then start the nginx process
EXPOSE 80