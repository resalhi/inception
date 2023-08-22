FROM alpine:latest

RUN apk update && apk upgrade && apk add nginx && apk add openssl
COPY requirements/nginx/conf/nginx.conf /etc/nginx/http.d/default.conf
RUN mkdir -p /etc/nginx/ssl
COPY requirements/nginx/tools/inception.crt /etc/nginx/ssl/
COPY requirements/nginx/tools/inception.key /etc/nginx/ssl/
CMD [ "nginx", "-g", "daemon off;" ]
