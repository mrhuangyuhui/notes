FROM node:12.16.1-alpine3.11 as builder 

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build 

FROM nginx:1.16.1-alpine

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
