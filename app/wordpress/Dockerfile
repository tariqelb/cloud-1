FROM wordpress:6.7.2-php8.1-fpm-alpine

COPY config/launch_script.sh /launch_script.sh

RUN chmod +x /launch_script.sh

RUN /bin/mkdir -p /usr/share/nginx/html

ENTRYPOINT ["sh", "/launch_script.sh"]
