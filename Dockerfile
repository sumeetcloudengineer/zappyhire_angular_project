# Build Application
FROM node:19-alpine AS build

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

# Serve Application using Nginx Server
FROM nginx:alpine

COPY --from=build /app/dist/zappy_boiler_plate /usr/share/nginx/html

EXPOSE 80

