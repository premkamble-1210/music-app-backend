# Use Node.js as the base image
FROM node:20

# Install system-level dependencies, including youtube-dl
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    && pip3 install youtube-dl

# Set the working directory
WORKDIR /usr/src/app

# Copy application files
COPY . .

# Install Node.js dependencies
RUN npm install

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
