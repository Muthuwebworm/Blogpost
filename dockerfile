FROM node:18.17.0 AS base
WORKDIR /src
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=base /src/dist /usr/share/nginx/html
EXPOSE 80
