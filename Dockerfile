FROM nginx:alpine

# Copy the built React app from the previous stage
COPY build /usr/share/nginx/html

# Copy the nginx configuration file
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
