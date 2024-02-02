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

# Path: srcs/requirements/nginx/Dockerfile

FROM debian:bullseye

RUN apt update
RUN apt install nginx openssl curl vim -y
RUN rm -rf /var/lib/apt/lists/*


RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/ssl/certs/lfiorini.42.fr.crt \
       -keyout /etc/ssl/private/lfiorini.42.fr.key \
       -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/OU=student/CN=lfiorini.42.fr/"

# ARG DOMAIN=$DOMAIN_NAME
# RUN openssl req -x509 -nodes -subj "/CN=${DOMAIN_NAME}" -addext "subjectAltName=DNS:${DOMAIN_NAME}" \
#     -days 42 -newkey rsa:4096 -keyout /etc/ssl/private/${DOMAIN_NAME}.key -out /etc/ssl/certs/${DOMAIN_NAME}.crt

# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 42 -nodes \
#        -out /etc/nginx/ssl/lfiorini.crt \
#        -keyout /etc/nginx/ssl/lfiorini.key \
#        -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/OU=student/CN=lfiorini.42.fr/"

COPY conf/nginx_1.conf /etc/nginx/nginx.conf
COPY conf/lfiorini.42.fr.conf /etc/nginx/sites-available/default
RUN rm -rf /var/www/

EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

