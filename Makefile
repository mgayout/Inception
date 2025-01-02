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

all :
	mkdir -p volumes/mariadb
	mkdir -p volumes/wordpress
	chmod 777 volumes volumes/mariadb volumes/wordpress
	cd srcs && docker-compose up --build

clean :
	cd srcs && docker-compose down
	sudo rm -rf volumes/mariadb volumes/wordpress volumes

fclean : clean
	docker system prune -a -f --volumes
	docker network prune -f
	docker network rm $$(docker network ls -q) 2>/dev/null || true
	docker volume rm $$(docker volume ls -qf dangling=true) 2>/dev/null || true

re : fclean all