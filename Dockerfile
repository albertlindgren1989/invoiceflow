FROM node:22-slim
WORKDIR /app

# Install all dependencies (including devDependencies for build)
COPY package.json ./
RUN npm install

# Copy source files
COPY src/ ./src/
COPY index.html ./
COPY vite.config.js ./
COPY server/ ./server/

# Build frontend
RUN npm run build

# Remove devDependencies to slim down
RUN npm prune --omit=dev

EXPOSE 3000
ENV NODE_ENV=production
CMD ["node", "server/index.js"]
