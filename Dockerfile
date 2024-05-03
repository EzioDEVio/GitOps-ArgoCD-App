
# Specify the base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Create a user 'appuser' with a specific user ID, and set directory permissions
RUN adduser --disabled-login --uid 1001 --gecos "" appuser && chown -R appuser /usr/src/app

# Switch to the non-root user
USER 1001

# Expose the port the app runs on
EXPOSE 3000

# Specify the command to run the app
CMD ["node", "app.js"]
