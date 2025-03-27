FROM adminer:5

USER root

RUN apk update && apk add vim 

RUN apk add --no-cache mysql-client

USER	adminer

ENTRYPOINT ["php", "-S", "[::]:8080", "-t", "/var/www/html"] 
