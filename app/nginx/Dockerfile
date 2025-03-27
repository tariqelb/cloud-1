FROM nginx:alpine

RUN apk update && apk upgrade

RUN apk add openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/nginx_selfsigned.key \
  -out /etc/ssl/certs/nginx_selfsigned.crt \
  -subj "/CN=tel-bouh.1337.ma/O=Your Organization/C=MA"

RUN /bin/mkdir -p /usr/share/nginx/html
RUN /bin/mkdir -p /var/www/html

RUN chmod -R 744 /var/www/html
RUN rm -rf /etc/nginx/conf.d/default.conf

COPY ./config/server.conf /etc/nginx/http.d/default.conf
COPY ./config/server.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
