FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl

COPY requirements/nginx/tools/ressalhi.crt /etc/nginx/ssl/
COPY requirements/nginx/tools/ressalhi.key /etc/nginx/ssl/

COPY requirements/nginx/conf/nginx.conf /etc/nginx/http.d/default.conf

# EXPOSE 8443

CMD [ "nginx", "-g", "daemon off;" ]
