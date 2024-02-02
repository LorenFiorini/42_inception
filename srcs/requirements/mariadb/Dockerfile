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

# Path: srcs/requirements/mariadb/Dockerfile

FROM debian:oldstable

RUN apt update
RUN apt install -y mariadb-server

RUN mkdir /run/mysqld
COPY conf/my-server_3.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/my-script_5.sh /usr/local/bin/my-script_5.sh
RUN chmod +x /usr/local/bin/my-script_5.sh 

# ENTRYPOINT ["/usr/local/bin/my-script_5.sh"]
CMD ["/usr/local/bin/my-script_5.sh"]

# docker build -t mariadb --no-cache srcs/requirements/mariadb/
# docker run -it mariadb:latest
