# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/09 23:25:15 by lfiorini          #+#    #+#              #
#    Updated: 2023/11/15 06:35:57 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update
RUN apt install nginx openssl curl vim -y
RUN rm -rf /var/lib/apt/lists/*

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/ssl/certs/lfiorini.42.fr.crt \
       -keyout /etc/ssl/private/lfiorini.42.fr.key \
       -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/OU=student/CN=lfiorini.42.fr/"

COPY conf/nginx_1.conf /etc/nginx/nginx.conf
COPY conf/lfiorini.42.fr.conf /etc/nginx/sites-available/default
RUN rm -rf /var/www/

EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

