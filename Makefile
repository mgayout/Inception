# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mgayout <mgayout@student.42nice.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/30 10:11:13 by mgayout           #+#    #+#              #
#    Updated: 2024/12/30 10:11:13 by mgayout          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up :
	@docker-compose -f ./srcs/docker-compose.yml up -d
down :
	@docker-compose -f ./srcs/docker-compose.yml down
stop :
	@docker-compose -f ./srcs/docker-compose.yml stop
start :
	@docker-compose -f ./srcs/docker-compose.yml start
status :
	@docker ps