# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2024/02/02 00:44:05 by lfiorini         ###   ########.fr        #
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
	@echo "\033[35m> docker ps -a \033[0m"
	@ docker ps -a
	@echo "\033[35m> docker image ls -a \033[0m"
	@ docker image ls -a
	@echo "\033[35m> docker network ls \033[0m"
	@ docker network ls
	@echo "\033[35m> docker volume ls \033[0m"
	@ docker volume ls


clean:
	docker compose -f srcs/docker-compose.yml down -v
	-docker image rm -f srcs-nginx srcs-mariadb srcs-wordpress
# docker system prune -f


# To-do: if not empty $$... 
fclean:
	@ set -e
	@echo "\033[33m> docker stop $$(docker ps -qa) \033[0m"
	@ -docker stop "$$(docker ps -qa)" 2>/dev/null
	@echo "\033[33m> docker container rm $$(docker ps -qa) \033[0m"
	@ -docker container rm "$$(docker ps -qa)" 2>/dev/null
	@echo "\033[33m> docker image rm -f $$(docker images -qa) \033[0m"
	@ -docker image rm -f "$$(docker images -qa)" 2>/dev/null
	@echo "\033[33m> docker network rm $$(docker network ls -q) \033[0m"
	@ -docker network rm "$$(docker network ls -q)" 2>/dev/null
	@echo "\033[33m> docker volume rm $$(docker volume ls -q) \033[0m"
	@ -docker volume rm "$$(docker volume ls -q)" 2>/dev/null


# re: down
# 	docker compose -f srcs/docker-compose.yml up -d --build

re: down
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d

.PHONY: all clean fclean re 
