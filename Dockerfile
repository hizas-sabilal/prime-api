# Use official Node.js image
FROM node:22-slim

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy app source
COPY . .

# Expose port (Cloud Run uses PORT env)
EXPOSE 8080

# Start app
CMD ["npm", "run", "start"]
