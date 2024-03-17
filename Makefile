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
		@docker system prune -af 2> /dev/null || true
		@sudo rm -rf $(DB_VOLUME) $(WP_VOLUME) 

re: down all

.PHONY: all down stop

