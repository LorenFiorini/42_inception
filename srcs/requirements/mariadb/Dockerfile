# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/09 23:25:09 by lfiorini          #+#    #+#              #
#    Updated: 2024/01/28 15:51:04 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update
RUN apt install -y mariadb-server

RUN mkdir /run/mysqld
COPY conf/my-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/my-script.sh /usr/local/bin/my-script.sh
RUN chmod +x /usr/local/bin/my-script.sh 

CMD ["/usr/local/bin/my-script.sh"]
