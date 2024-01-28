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

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install curl php php-fpm php-mysql mariadb-client


# Create directory and download WordPress
RUN mkdir /var/www
RUN	mkdir -p /var/www

RUN curl -O https://wordpress.org/wordpress-6.4.2.tar.gz && \
    tar -xzvf wordpress-6.4.2.tar.gz -C /var/www && \
    rm wordpress-6.4.2.tar.gz

# Install and configure WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/


# Set ownership and permissions
RUN chown -R root:root /var/www/wordpress


# Copy the script and make it executable
COPY ./tools/script.sh .
RUN chmod +x script.sh


ENTRYPOINT ["./script.sh"]
