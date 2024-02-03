#! /usr/bin/env /bin/bash


mkdir -p /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress 
cd /var/www/wordpress

if ! sudo -u www-data wp-cli.phar core is-installed --path=/var/www/wordpress; then
	sudo -u www-data wp-cli.phar core download --path=/var/www/wordpress
	sudo -u www-data wp-cli.phar config create --dbhost=mariadb --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --allow-root --force
	sudo -u www-data wp-cli.phar core install --url==${WP_URL} --title=lfiorini --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=admin@lfiorini.42.fr
	sudo -u www-data wp-cli.phar config set HTTP_HOST 'nginx'
	sudo -u www-data wp-cli.phar config set WP_SITEURL "https://${WP_URL}"
	sudo -u www-data wp-cli.phar config set WP_HOME "https://${WP_URL}"
	sudo -u www-data wp-cli.phar config set CONCATENATE_SCRIPTS false
	sudo -u www-data wp-cli.phar config set SCRIPT_DEBUG true
	sudo -u www-data wp-cli.phar user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_PASS}
else
	echo "Wordpress is already installed"
fi

mkdir -p /run/php
exec /usr/sbin/php-fpm7.4 -F --allow-to-run-as-root
