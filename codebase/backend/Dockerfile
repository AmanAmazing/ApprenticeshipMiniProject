# Backend Dockerfile for Express App
# Will require Node and packages installed with npm install.
# Entrypoint of express app is `node index.js` 
FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY index.js .
USER node
EXPOSE 5000
CMD ["node","index.js"]
