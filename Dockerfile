FROM node:current-slim

WORKDIR /usr/src/app

ENV PORT 3000

COPY package.json .
RUN npm install --only=production
RUN npm build

EXPOSE 3000
CMD [ "npm", "start" ]

COPY . .