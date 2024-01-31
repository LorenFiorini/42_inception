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

# Path: srcs/requirements/wordpress/Dockerfile

FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt -y install curl php php-fpm php-mysql mariadb-client


# Create directory and download WordPress
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

ARG SCRIPT=script_1.sh

# Copy the script and make it executable
COPY ./tools/script_1.sh /script_1.sh
RUN chmod +x script_1.sh


ENTRYPOINT ["./script_1.sh"]


# docker build -t wordpress --no-cache srcs/requirements/wordpress/
# docker run -it wordpress:latest
