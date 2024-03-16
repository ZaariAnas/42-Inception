DB_VOLUME := $(HOME)/data/mariadb-volume
WP_VOLUME := $(HOME)/data/wordpress-volume

all:
		@mkdir -p $(DB_VOLUME) $(WP_VOLUME)
		@docker-compose -f srcs/docker-compose.yml up --build  # Fixed indentation and command

down:
		@docker-compose -f srcs/docker-compose.yml down  # Fixed indentation

stop:
		@docker stop $(docker ps -q)
		@docker rm $(docker ps -aq)  # Fixed indentation

fclean: down
		@docker stop $(docker ps -qa)
		@docker rm $(docker ps -aq)
		@docker rmi -f $(docker images -qa)
		@docker volume rm $(docker volume ls -q)
		@docker network rm $(docker network ls -q)
		@docker system prune -af
		@rm -rf $(DB_VOLUME) $(WP_VOLUME)  # Fixed indentation

re: down all

.PHONY: all down stop

