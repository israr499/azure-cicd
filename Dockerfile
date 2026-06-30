FROM node:20-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM base AS production
COPY src/ ./src/
EXPOSE 3000
CMD ["node", "src/index.js"]
