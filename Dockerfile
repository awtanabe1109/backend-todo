FROM node:18 as base

WORKDIR /app

# * で lockもか
COPY package*.json ./
RUN npm i
COPY . .

RUN npm run build

FROM base as dev

WORKDIR /app
COPY package*.json ./
RUN npm install

CMD ["npm", "run", "start:dev"]
