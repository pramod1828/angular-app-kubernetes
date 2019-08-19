# stage 1
FROM node:10
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /var/lib/docker/overlay2/4dbe4c19e87d2c0e97f1b446743a961f211e376fa2f39c23baf528febb32c69a/merged/app/dist/angular-app /usr/share/nginx/html
