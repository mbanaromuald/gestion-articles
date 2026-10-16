FROM node:20-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install --production

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY package*.json ./
COPY src ./src
EXPOSE 3000
CMD ["npm", "start"]
