# FROM node:20.4-alpine3.17

# # COPY index.js package.json /app/
# COPY . /app/
# WORKDIR /app/

# RUN npm install

# cmd ['npm','run','dev']


FROM node:20.4-alpine3.17

WORKDIR /app
COPY . .

RUN apk add --no-cache npm \
    && npm install \
    && npm install -D nodemon

CMD ["npm", "run", "dev"]
