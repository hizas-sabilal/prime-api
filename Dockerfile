# Step 1: Build stage
FROM node:22-alpine AS builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source code and build
COPY . .
RUN npm run build

# Step 2: Production stage
FROM node:22-alpine

WORKDIR /app

# Copy only production dependencies and built app
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

# Expose the port your app uses
EXPOSE 3000

# Start the app
CMD ["node", "dist/index.js"]
