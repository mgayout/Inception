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

VOLPATH		= /home/mgayout/data
DOCKPATH	= ./srcs/docker-compose.yml

all :
	@sudo mkdir -p $(VOLPATH)/mariadb
	@sudo mkdir -p $(VOLPATH)/wordpress
	@sudo chmod 777 $(VOLPATH)/mariadb
	@sudo chmod 777 $(VOLPATH)/wordpress
	@sudo docker compose -f $(DOCKPATH) up -d

down :
	@docker compose -f $(DOCKPATH) down -v

re :
	@docker compose -f $(DOCKPATH) up -d --build

clear :
	@sudo rm -rf $(VOLPATH)/mariadb
	@sudo rm -rf $(VOLPATH)/wordpress
	@sudo docker system prune -a --volumes
	@sudo docker volume rm srcs_mariadb
	@sudo docker volume rm srcs_wordpress

clean :
	@sudo docker stop $$(docker ps -qa)
	@sudo docker rm $$(docker ps -qa)
	@sudo docker network prune -f
	@sudo docker rmi $(docker images -q)
	