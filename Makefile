# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2024/01/31 05:07:55 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


COMPOSE_YML		:= ./srcs/docker-compose.yml
MARIADB_VOL		:= /home/lfiorini/data/mariadb
WORDPRESS_VOL	:= /home/lfiorini/data/wordpress

YELLOW			:= \033[33m
GREEN			:= \033[35m
END_COLOR		:=  \033[0m

all:
	@mkdir -p $(MARIADB_VOL)
	@mkdir -p $(WORDPRESS_VOL)
	docker compose -f $(COMPOSE_YML) up -d

down:
	docker compose -f $(COMPOSE_YML) down -v

stop:
	docker compose -f $(COMPOSE_YML) stop

start:
	docker compose -f $(COMPOSE_YML) start

ls:
	@echo "$(GREEN)> docker ps -a $(END_COLOR)"
	@ docker ps -a
	@echo "$(GREEN)> docker image ls -a $(END_COLOR)"
	@ docker image ls -a
	@echo "$(GREEN)> docker network ls $(END_COLOR)"
	@ docker network ls
	@echo "$(GREEN)> docker volume ls $(END_COLOR)"
	@ docker volume ls


clean:
	docker compose -f srcs/docker-compose.yml down -v
	-docker image rm -f srcs-nginx srcs-mariadb srcs-wordpress
# docker system prune -f


# To-do: if not empty $$... 

fclean:
	@ set -e
	@echo "$(YELLOW)> docker stop $$(docker ps -qa) $(END_COLOR)"
	@ -docker stop "$$(docker ps -qa)" 2>./debug/mk_fclean.log
	@echo "$(YELLOW)> docker container rm $$(docker ps -qa) $(END_COLOR)"
	@ -docker container rm "$$(docker ps -qa)" 2>./debug/mk_fclean.log
	@echo "$(YELLOW)> docker image rm -f $$(docker images -qa) $(END_COLOR)"
	@ -docker image rm -f "$$(docker images -qa)" 2>./debug/mk_fclean.log
	@echo "$(YELLOW)> docker network rm $$(docker network ls -q) $(END_COLOR)"
	@ -docker network rm "$$(docker network ls -q)" 2>./debug/mk_fclean.log
	@echo "$(YELLOW)> docker volume rm $$(docker volume ls -q) $(END_COLOR)"
	@ -docker volume rm "$$(docker volume ls -q)" 2>./debug/mk_fclean.log


# re: down
# 	docker compose -f srcs/docker-compose.yml up -d --build

re: down
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d

.PHONY: all clean fclean re 
