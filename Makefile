# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2024/01/29 02:21:19 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


MARIADB_VOL		:= /home/lfiorini/data/mariadb
WORDPRESS_VOL	:= /home/lfiorini/data/wordpress

all:
	@mkdir -p $(MARIADB_VOL)
	@mkdir -p $(WORDPRESS_VOL)
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down -v

stop:
	docker compose -f srcs/docker-compose.yml stop

start:
	docker compose -f srcs/docker-compose.yml start

ls:
	docker ps -a
	docker image ls -a
	docker network ls
	docker volume ls


clean:
	docker compose -f srcs/docker-compose.yml down -v
	-docker image rm -f srcs-nginx srcs-mariadb srcs-wordpress
# docker system prune -f


# To-do: if not empty $$... 

fclean:
	@set -e
	-docker stop $$(docker ps -qa) 2>/dev/null
	-docker container rm $$(docker ps -qa) 2>/dev/null
	-docker image rm -f $$(docker images -qa) 2>/dev/null
	-docker network rm $$(docker network ls -q) 2>/dev/null
	-docker volume rm $$(docker volume ls -q) 2>/dev/null


# re: down
# 	docker compose -f srcs/docker-compose.yml up -d --build

re: down
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d

.PHONY: all clean fclean re 
