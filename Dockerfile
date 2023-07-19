FROM node:20.4-alpine3.17

# COPY index.js package.json /app/
COPY . /app/
WORKDIR /app/

RUN npm install

cmd ['npm','run','dev']