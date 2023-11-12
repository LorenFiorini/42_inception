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
	docker-compose -f ./scrs/docker-compose.yml up -d --build

clean:
	docker-compose -f ./scrs/docker-compose.yml down
	
re: clean all

.PHONY: all clean re
