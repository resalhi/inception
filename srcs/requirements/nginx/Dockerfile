FROM alpine:3.14

RUN apk update && apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl

COPY requirements/nginx/tools/ressalhi.crt /etc/nginx/ssl/
COPY requirements/nginx/tools/ressalhi.key /etc/nginx/ssl/

COPY requirements/nginx/conf/default.conf /etc/nginx/http.d/

CMD [ "nginx", "-g", "daemon off;" ]
