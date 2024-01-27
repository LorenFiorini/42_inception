# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/09 23:25:20 by lfiorini          #+#    #+#              #
#    Updated: 2023/11/12 07:42:40 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Path: srcs/requirements/wordpress/Dockerfile

FROM debian:bullseye

RUN apt update && apt install curl php8.2 php-fpm php-mysql mariadb-client -y

RUN	mkdir -p /var/www
RUN	curl -O https://wordpress.org/wordpress-6.4.2.tar.gz \
	&& tar -xzvf wordpress-6.4.2.tar.gz -C /var/www \
	&& rm wordpress-6.4.2.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN	chown -R root:root /var/www/wordpress

COPY ./tools/script.sh .
RUN chmod +x script.sh

ENTRYPOINT ["./script.sh"]
