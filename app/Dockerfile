# Etap budowania aplikacji
FROM node:16 AS build-stage

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Etap produkcyjny (nginx)
FROM nginx:latest AS production-stage

RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

COPY --from=build-stage /app /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["/bin/sh", "-c", "export SECRET_VALUE=$SECRET_VALUE && envsubst < /usr/share/nginx/html/index.html > /usr/share/nginx/html/index.tmp.html && mv /usr/share/nginx/html/index.tmp.html /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"]
