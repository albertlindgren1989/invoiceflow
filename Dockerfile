FROM node:22-slim
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY dist/ ./dist/
COPY server/ ./server/
EXPOSE 3000
ENV NODE_ENV=production
CMD ["node", "server/index.js"]
