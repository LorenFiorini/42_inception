# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/09 23:25:09 by lfiorini          #+#    #+#              #
#    Updated: 2023/11/12 07:41:59 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Path: srcs/requirements/mariadb/Dockerfile

FROM debian:bullseye

RUN apt update && apt install mariadb-server -y


# COPY ./conf/default.conf /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

# COPY ./tools/script.sh .
# RUN chmod +x script.sh

# ENTRYPOINT ["./script.sh"]

# For debugging
ENTRYPOINT ["./setup.sh"]
