FROM alpine:latest

RUN apk update && apk upgrade && apk add nginx && apk add openssl
COPY conf/nginx.conf /etc/nginx/http.d/default.conf
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MO/L=BG/O=1337/OU=student/CN=ressalhi.42.fr"
CMD [ "nginx", "-g", "daemon off;" ]