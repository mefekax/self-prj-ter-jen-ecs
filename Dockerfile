# Build stage
# FROM --platform=linux/arm64 node:20-alpine AS builder
FROM node:20-alpine AS mimar
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm ci --only=production
# Runtime stage
FROM node:20-alpine
WORKDIR /app
COPY --from=mimar /app/node_modules ./node_modules
COPY --from=mimar /app .    
CMD ["node", "index.js"]

