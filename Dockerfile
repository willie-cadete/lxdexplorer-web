FROM node:alpine as builder

ARG VITE_API_URL=''

# Set the working directory

WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the source code
COPY . .

# Build the app
RUN npm run build

# Use a smaller image for production
FROM nginx:alpine as production

# Copy the built React app from the previous stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy the nginx configuration file
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Expose the port
EXPOSE 80

# Start the server
CMD ["nginx", "-g", "daemon off;"]
