# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2024/02/03 04:20:29 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# /home/lfiorini/42/inception

MARIADB_VOL		:= /home/lfiorini/data/mariadb
WORDPRESS_VOL	:= /home/lfiorini/data/wordpress

COMPOSE_YML		:= ./srcs/docker-compose.yml
DEBUG			:= ./debug/makefile/04.log

GREEN			:= \033[32m
YELLOW			:= \033[33m
C_END			:= \033[0m


include ./srcs/.env

all:
	mkdir -p $(MARIADB_VOL)
	mkdir -p $(WORDPRESS_VOL)
	docker compose -f $(COMPOSE_YML) up -d --build

down:
	docker compose -f $(COMPOSE_YML) down

stop:
	docker compose -f $(COMPOSE_YML) stop

start:
	docker compose -f $(COMPOSE_YML) start

ls:
	@		echo "$(GREEN)> docker ps -a $(C_END)"
	@ docker ps -a
	@		echo "$(GREEN)> docker image ls -a $(C_END)"
	@ docker image ls -a
	@		echo "$(GREEN)> docker network ls $(C_END)"
	@ docker network ls
	@		echo "$(GREEN)> docker volume ls $(C_END)"
	@ docker volume ls


clean:
	-docker compose -f $(COMPOSE_YML) down 2>>$(DEBUG)
	-docker image rm -f srcs-nginx srcs-mariadb srcs-wordpress  2>>$(DEBUG)

fclean: clean
	-docker system prune -f --all
	docker volume rm $$(docker volume ls -q) 2>>$(DEBUG)

re: fclean all

.PHONY: all clean fclean re 
