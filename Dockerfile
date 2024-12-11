# Use Debian as the base image for more control
FROM debian:bullseye

# Install required tools and dependencies
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    python3 \
    python3-pip \
    ffmpeg

# Install yt-dlp (actively maintained fork of youtube-dl)
RUN pip3 install yt-dlp

# Install Node.js (if not available in the apt repository)
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs

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
