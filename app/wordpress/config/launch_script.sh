#!/bin/sh
echo "<?php" >> /wp-config.php
echo "define(""'DB_NAME'"", ""'$DATABASE'"");" >>  /wp-config.php
echo "define(""'DB_USER'"", ""'$USER'"");"  >>   /wp-config.php 
echo "define(""'DB_PASSWORD'"", ""'$USER_PASSWORD'"");" >>  /wp-config.php
echo "define(""'DB_HOST'"", ""'$HOST'"");"   >>  /wp-config.php
echo "define(""'DB_CHAERSET'"", ""'utf8'"");" >> /wp-config.php
echo "define(""'DB_COLLATE'"", ""'utf8_unicode_ci'"");" >> /wp-config.php

echo '$table_prefix'" = 'wp_';" >> /wp-config.php
echo 'define(""'WP-DEBUG'"", ""'true'"");'

#echo "define(""'WP_REDIS_HOST'"", ""'$REDIS_HOST'"");" >> /wp-config.php
#echo "define(""'WP_REDIS_PORT'"", ""'$REDIS_PORT'"");" >> /wp-config.php
#echo "define(""'WP_CACHE_KEY_SALT'"", ""'$DOMAIN_NAME'"");" >> /wp-config.php
#echo "define(""'WP_REDIS_PASSWORD'"", ""'$RDS_PASSWORD'"");" >> /wp-config.php
#echo "define(""'WP_CACHE'"", ""'true'"");"  >> /wp-config.php


echo "if ( ! defined( 'ABSPATH' ) ) {" >> /wp-config.php
echo "	define( 'ABSPATH', __DIR__ . '/' );" >> /wp-config.php
echo "}" >> /wp-config.php  

echo "require_once ABSPATH . 'wp-settings.php';" >> /wp-config.php

#cp -rf /wp-config.php /usr/share/nginx/html/.
#rm -rf /wordpress/wp-config.php
#cp -rf /wordpress/* /usr/share/nginx/html/.
#chown -R nginx:nginx /usr/share/nginx
#chown -R nginx:nginx /usr/share/nginx/html
#chmod -R 744 /usr/share/nginx
#php-fpm8 -F -R

tail -f /dev/null
