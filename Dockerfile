FROM node:20.11.1-alpine3.19
WORKDIR node-app
COPY package*.json ./
RUN npm install
RUN ls
RUN npm run test
COPY . .
EXPOSE 3000
CMD ["npm", "start"]

