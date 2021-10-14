FROM node:14-alpine3.14 as build

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci --production

COPY . . 

RUN npm run build

# NGINX
FROM nginx:1.21.3-alpine as prod

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
