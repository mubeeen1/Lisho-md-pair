FROM node:lts

# Install necessary packages
RUN apt-get update && \
    apt-get install -y ffmpeg imagemagick webp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Command to run your application
CMD ["npm", "start"]
