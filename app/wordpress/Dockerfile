FROM wordpress:6.7.2-php8.1-fpm-alpine

COPY config/launch_script.sh /launch_script.sh

RUN chmod +x /launch_script.sh

RUN apk add wget

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xzf latest.tar.gz --strip-components=1

RUN rm latest.tar.gz

ENTRYPOINT ["sh", "/launch_script.sh"]
