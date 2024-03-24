FROM nginx:stable-alpine3.17-slim

COPY ./default.conf /etc/nginx/conf.d/

COPY ./nginx.conf /etc/nginx/

COPY ./reloader.sh /

COPY ./docker-entrypoint.d/* /docker-entrypoint.d/

RUN apk add --no-cache inotify-tools

