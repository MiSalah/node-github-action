# Use Node.js v14 as the base image
FROM node:14

# Create a working directory for the app
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the frontend code to the app directory
COPY client ./client

# Build the frontend code
RUN cd client && npm install && npm run build

# Copy the backend code to the app directory
COPY server ./server

# Expose port 3000 for the app
EXPOSE 3000

# Start the app
CMD [ "npm", "run", "start" ]
