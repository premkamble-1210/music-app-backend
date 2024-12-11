FROM node:18

# Install Python and dependencies
RUN apt-get update && apt-get install -y python3 python3-pip

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy application code
COPY . .

# Expose necessary ports and start the app (if needed)

EXPOSE 3000

# Start the application
CMD ["npm", "start"]
