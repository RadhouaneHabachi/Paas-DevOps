# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install -g npm-check-updates
RUN ncu -u
RUN npm install --legacy-peer-deps --force
RUN npm run build
# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
