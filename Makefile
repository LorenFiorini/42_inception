# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2024/02/02 01:34:35 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# /home/lfiorini/42/inception

MARIADB_VOL		:= /home/lfiorini/data/mariadb
WORDPRESS_VOL	:= /home/lfiorini/data/wordpress

COMPOSE_YML		:= ./srcs/docker-compose.yml
DEBUG			:= ./debug/makefile/03.log

GREEN			:= \033[32m
YELLOW			:= \033[33m
C_END			:= \033[0m

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
	@echo "$(GREEN)> docker ps -a $(C_END)"
	@ docker ps -a
	@echo "$(GREEN)> docker image ls -a $(C_END)"
	@ docker image ls -a
	@echo "$(GREEN)> docker network ls $(C_END)"
	@ docker network ls
	@echo "$(GREEN)> docker volume ls $(C_END)"
	@ docker volume ls


clean:
	-docker compose -f srcs/docker-compose.yml down -v  2>$(DEBUG)
	-docker image rm -f srcs-nginx srcs-mariadb srcs-wordpress  2>$(DEBUG)
	docker system prune -f --all
# docker system prune -f


# To-do: if not empty $$... 

fclean:
	@echo "$(YELLOW)> docker stop $(C_END)"
	@-docker stop $$(docker ps -qa) 2>$(DEBUG)
	@echo "$(YELLOW)> docker container rm $(C_END)"
	@-docker container rm $$(docker ps -qa) 2>$(DEBUG)
	@echo "$(YELLOW)> docker image rm -f $(C_END)"
	@-docker image rm -f $$(docker images -qa) 2>$(DEBUG)
	@echo "$(YELLOW)> docker network rm $(C_END)"
	@-docker network rm $$(docker network ls -q) 2>$(DEBUG)
	@echo "$(YELLOW)> docker volume rm $(C_END)"
	@-docker volume rm $$(docker volume ls -q) 2>$(DEBUG)


# re: down
# 	docker compose -f srcs/docker-compose.yml up -d --build

re: down
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up -d

.PHONY: all clean fclean re 
