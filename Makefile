# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2024/02/03 03:49:05 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# /home/lfiorini/42/inception

MARIADB_VOL		:= /home/lfiorini/data/mariadb
WORDPRESS_VOL	:= /home/lfiorini/data/wordpress

COMPOSE_YML		:= ./srcs/docker-compose.yml
DEBUG			:= ./debug/makefile/05.log

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

# To-do: if not empty $$... 

fclean: clean
	-docker system prune -f --all
#	@		echo "$(YELLOW)> docker stop $(C_END)"
#	@-sudo docker stop $$(docker ps -qa) 2>>$(DEBUG)
#	@		echo "$(YELLOW)> docker container rm $(C_END)"
#	@-sudo docker container rm $$(docker ps -qa) 2>>$(DEBUG)
#	@		echo "$(YELLOW)> docker image rm -f $(C_END)"
#	@-sudo docker image rm -f $$(docker images -qa) 2>>$(DEBUG)
#	@		echo "$(YELLOW)> docker network rm $(C_END)"
#	@-sudo docker network rm $$(docker network ls -q) 2>>$(DEBUG)
#	@		echo "$(YELLOW)> docker volume rm $(C_END)"
#	@-sudo docker volume rm $$(docker volume ls -q) 2>>$(DEBUG)

re: fclean all

.PHONY: all clean fclean re 
