
FROM node:20

WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install -g expo-cli

COPY . .

EXPOSE 8081

CMD ["npx", "expo", "start", "--web", "--host", "lan"]
