NAME	= 	Inception

USER	=	azari

all:
	@mkdir -p /home/$(USER)/data
	@docker-compose -f srcs/docker-compose.yml up -d --build

fclean:
	
