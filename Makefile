# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2024/01/28 19:30:20 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


MARIADB_VOL		:= /home/lfiorini/data/mariadb
WORDPRESS_VOL	:= /home/lfiorini/data/wordpress

# Build and start the services
all:
	@mkdir -p $(MARIADB_VOL)
	@mkdir -p $(WORDPRESS_VOL)
	docker compose -f srcs/docker-compose.yml up -d

# Stop and remove containers, networks, and volumes
#down:
#	docker compose -f srcs/docker-compose.yml down -v

# Stop the services
#stop:
#	docker compose -f srcs/docker-compose.yml stop

# Start the services
#start:
#	docker compose -f srcs/docker-compose.yml start

list:
	docker ps -a
	@ echo " "
	docker image ls -a
	@ echo " "
	docker network ls
	@ echo " "
	docker volume ls


clean:
	docker compose -f srcs/docker-compose.yml down -v
	-docker image rm -f nginx mariadb wordpress
	docker system prune -f

fclean:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker image rm -f $$(docker images -qa)
	-docker network rm $$(docker network ls -q) 
	-docker volume rm $$(docker volume ls -q) 2>/dev/null


# re: down
# 	docker compose -f srcs/docker-compose.yml up -d --build

re: down
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d

.PHONY: all clean fclean re 
