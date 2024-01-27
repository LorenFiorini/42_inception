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

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y 

# COPY ./conf/my-server_2.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/setup.sh /
RUN chmod +x /setup.sh



ENTRYPOINT ["/setup.sh"]
# CMD ["/setup.sh"]

CMD ["mysqld"]
