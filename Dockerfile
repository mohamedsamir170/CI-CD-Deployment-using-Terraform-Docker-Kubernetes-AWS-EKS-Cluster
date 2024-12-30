# Use the first stage for building the application
FROM node:22-slim AS build

WORKDIR /usr/src/app

# Copy only package.json and package-lock.json to leverage Docker's caching
COPY package*.json ./

# Install dependencies needed for the build
RUN npm install

# Copy the rest of the application code
COPY . .

# Run the build process
RUN npm run build

# Use a second stage for the production image
FROM node:22-slim

WORKDIR /usr/src/app

# Copy only production dependencies
COPY package*.json ./
RUN npm install --only=production

# Copy the built application and other necessary files
COPY --from=build /usr/src/app/.next .next
COPY --from=build /usr/src/app/public ./public
COPY --from=build /usr/src/app/package*.json ./

# Expose the application port
EXPOSE 3000

# Define the command to start the app
CMD ["npm", "start"]
