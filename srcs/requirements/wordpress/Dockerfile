# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/09 23:25:20 by lfiorini          #+#    #+#              #
#    Updated: 2024/01/29 03:32:56 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update
RUN apt install -y curl wget sudo unzip \
	mariadb-client fcgiwrap php \
	php-fpm php-mysqli php-json php-curl php-dom \
	php-exif php-fileinfo php-mbstring \
	php-xml php-zip php-redis php-cli php-phar \
	default-mysql-client php-mysql 

RUN	mkdir -p /var/www 
RUN chown -R www-data:www-data /var/www

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +rw /var/lib/php/sessions
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/php.ini /etc/php/7.4/fpm/php.ini
COPY tools/script_2.sh /my-script.sh

RUN chmod +x /my-script.sh


CMD ["/my-script.sh"]
