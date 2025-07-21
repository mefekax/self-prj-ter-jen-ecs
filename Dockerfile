# Build stage
# FROM --platform=linux/arm64 node:20-alpine AS builder
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
# Runtime stage
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .    
CMD ["node", "server.js"]

