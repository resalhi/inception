FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl
COPY requirements/nginx/tools/inception.crt /etc/nginx/ssl/
COPY requirements/nginx/tools/inception.key /etc/nginx/ssl/

COPY requirements/nginx/conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
