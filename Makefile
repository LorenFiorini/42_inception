# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2023/11/12 06:18:30 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p volumes/mariadb
	@mkdir -p volumes/wordpress
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml 
# --profile bonus --env-file srcs/bonus.env down -v

stop:
	docker compose -f srcs/docker-compose.yml 
# --profile bonus --env-file srcs/bonus.env stop

start:
	docker compose -f srcs/docker-compose.yml 
# --profile bonus --env-file srcs/bonus.env start

fclean: down
	@rm -rf volumes
	-docker rmi -f srcs-nginx srcs-mariadb srcs-wordpress  
	docker system prune -f
# srcs-ftp srcs-redis srcs-static srcs-cadvisor srcs-adminer
# docker system prune -f

re: down
	docker compose -f srcs/docker-compose.yml up -d --build

# bonus:
# 	docker compose -f srcs/docker-compose.yml --profile bonus --env-file srcs/bonus.env up -d

.PHONY: all up down stop fclean re 
# bonus
