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

FROM debian:bullseye

RUN apt-get update
RUN apt install -y mariadb-server

COPY ./conf/my-server_.conf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

# ARG SCRIPT=my-script_4.sh

COPY ./tools/my-script_4.sh /my-script_4.sh
RUN chmod +x /my-script_4.sh

ENTRYPOINT ["/my-script_4.sh"]

# docker build -t mariadb --no-cache srcs/requirements/mariadb/
# docker run -it mariadb:latest

