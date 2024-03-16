DB_VOLUME := $(HOME)/data/mariadb-volume
WP_VOLUME := $(HOME)/data/wordpress-volume

all:
		@mkdir -p $(DB_VOLUME) $(WP_VOLUME)
		@docker-compose -f srcs/docker-compose.yml up --build 

down:
		@docker-compose -f srcs/docker-compose.yml down
up:
		@docker-compose -f srcs/docker-compose.yml up 

fclean: down
		@docker stop $(docker ps -qa) 2> /dev/null || true
		@docker rm $(docker ps -aq) 2> /dev/null || true
		@docker rmi -f $(docker images -qa) 2> /dev/null || true
		@docker volume rm $(docker volume ls -q) 2> /dev/null || true
		@docker network rm $(docker network ls -q) 2> /dev/null || true
		@docker system prune -af 2> /dev/null || true
		@rm -rf $(DB_VOLUME) $(WP_VOLUME) 

re: down all

.PHONY: all down stop

