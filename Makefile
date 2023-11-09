# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfiorini <lfiorini@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/04 08:32:57 by lfiorini          #+#    #+#              #
#    Updated: 2023/11/09 23:24:05 by lfiorini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose up -d --build

clean:
	docker compose down

re: clean all


PHONY: all clean re
