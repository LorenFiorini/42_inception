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

FROM debian:oldstable

RUN apt update && apt install nginx openssl -y 
RUN rm -rf /var/lib/apt/lists/*

ARG DOMAIN=$DOMAIN_NAME
RUN openssl req -x509 -nodes -subj "/CN=${DOMAIN}" -addext "subjectAltName=DNS:${DOMAIN}" \
    -days 42 -newkey rsa:4096 -keyout /etc/ssl/private/${DOMAIN}.key -out /etc/ssl/certs/${DOMAIN}.crt


# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#        -out /etc/nginx/ssl/lfiorini.crt \
#        -keyout /etc/nginx/ssl/lfiorini.key \
#        -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/OU=student/CN=lfiorini.42.fr/"

# RUN mkdir -p /var/run/nginx
# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/lfiorini.42.fr.conf /etc/nginx/sites-available/default
RUN rm -rf /var/www/

# RUN mkdir -p /etc/nginx/conf.d/default
# # 3 -> 1

# COPY ./tools/script.sh .
# RUN chmod +x script.sh

EXPOSE 443

# ENTRYPOINT ["./script.sh"]

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

