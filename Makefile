name = inception
all:
	@printf "Launch configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up

build:
	@printf "Building configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up  --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

re:	fclean all
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up  --build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune -af
	@docker network prune --force
	@docker volume prune -f

.PHONY	: all build down re clean fclean
