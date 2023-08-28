all:
	@docker-compose -f ./srcs/docker-compose.yml up
build:
	@docker-compose -f ./srcs/docker-compose.yml up  --build
down:
	@docker-compose -f ./srcs/docker-compose.yml down
clean: down
	@docker system prune -af
fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune -af
	@docker network prune --force
	@docker volume prune -f
re:	fclean all
	@docker-compose -f ./srcs/docker-compose.yml up  --build

.PHONY	: all build down re clean fclean
