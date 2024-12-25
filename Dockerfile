FROM node:22-slim AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN npm run test

FROM node:22-slim

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package*.json ./
COPY --from=build /usr/src/app ./

RUN npm install --only=production

EXPOSE 3000

CMD ["npm", "start"]
