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

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl

# TODO: Run&Copy config ssl things

EXPOSE 443

# TODO: Copy config file from somewhere

# "-g" to read configuration from "/etc/nginx/nginx.conf"
# "daemon off;" to run nginx in foreground and print log to stdout
CMD ["nginx", "-g", "daemon off;"]
