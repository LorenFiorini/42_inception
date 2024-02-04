# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2024/02/03 06:24:18 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# /home/lfiorini/42/inception

COMPOSE_YML		:= ./srcs/docker-compose.yml
MARIADB_VOL		:= /home/lfiorini/data/mariadb
WORDPRESS_VOL	:= /home/lfiorini/data/wordpress

COMPOSE_YML		:= ./srcs/docker-compose.yml
DEBUG			:= ./debug/makefile/06.log

GREEN			:= \033[32m
YELLOW			:= \033[33m
C_END			:= \033[0m


include ./srcs/.env

all:
	sudo mkdir -p $(MARIADB_VOL)
	sudo mkdir -p $(WORDPRESS_VOL)
	docker compose -f $(COMPOSE_YML) up -d --build

down:
	docker compose -f $(COMPOSE_YML) down

stop:
	docker compose -f $(COMPOSE_YML) stop

start:
	docker compose -f $(COMPOSE_YML) start

rm_data:
	-sudo rm -rf $(MARIADB_VOL)
	-sudo rm -rf $(WORDPRESS_VOL)

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
	@		echo "$(YELLOW)> Cleaning... $(C_END)"
	-docker compose -f $(COMPOSE_YML) down 2>>$(DEBUG)
	-docker image rm -f srcs-nginx srcs-mariadb srcs-wordpress  2>>$(DEBUG)
	-docker volume rm $$(docker volume ls -q) 2>>$(DEBUG)

fclean:
	$(MAKE) clean 2>>$(DEBUG)
	-docker system prune -f --all 

re:	
	$(MAKE) fclean 2>>$(DEBUG)
	$(MAKE) rm_data 2>>$(DEBUG)
	$(MAKE) all 2>>$(DEBUG)


.PHONY: all clean fclean re 
