FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .
EXPOSE 8080
<<<<<<< HEAD
CMD ["node", "index.js"]
=======
CMD ["node", "index.js"]
>>>>>>> d18e635fb7a08fa53763f419781e4595405cf361
