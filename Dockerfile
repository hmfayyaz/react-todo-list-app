# Build Stage
# Use a Node.js base image
FROM node:16-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install --frozen-lockfile
# Copy the rest of the application code
COPY . .
# COPY .env .

RUN npm run build

# # Production Stage
# FROM node:16-alpine AS production

# WORKDIR /app

# COPY --from=build /app/build ./build

# COPY package*.json ./

# RUN npm install --production

# Expose the port that your react.js application will listen on
EXPOSE 3000

# Start the react.js application
CMD ["npm", "start"]
