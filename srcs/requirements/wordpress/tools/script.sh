#!/bin/bash

cd /var/www/wordpress

sleep 5

if [ -f ./wp-config.php ] ; then
	echo "Config already exists"
else
	wp config create	--allow-root \
						--dbname=$SQL_DB \
						--dbuser=$SQL_USR \
						--dbpass=$SQL_PWD \
						--dbhost=$SQL_HOSTNAME:3306 --path='/var/www/wordpress'
fi

if [ -z $BONUS ] && [ -f wp-content/object-cache.php ] ; then
	rm -rf wp-content/object-cache.php
fi

if wp core is-installed --url=$DOMAIN_NAME --allow-root ; then
	echo "Wordpress already installed"
else
	wp core install		--url=$DOMAIN_NAME/ \
						--title=$WP_TITLE \
						--admin_user=$WP_ADMIN_USR \
						--admin_password=$WP_ADMIN_PWD \
						--admin_email=$WP_ADMIN_EMAIL \
						--skip-email --allow-root
	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
	wp theme install astra --activate --allow-root
fi

if [ ! -z $BONUS ] && ! wp plugin is-installed redis-cache --allow-root ; then
	echo "Bonus enabled not installed"

	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --raw --allow-root
 	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root

	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp redis enable --allow-root
elif [ ! -z $BONUS ] && [ ! -f wp-content/object-cache.php ] ; then
	wp redis enable --allow-root
fi

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
sed -i 's/;clear_env = no/clear_env = no/g' /etc/php/8.2/fpm/pool.d/www.conf

/usr/sbin/php-fpm8.2 -F