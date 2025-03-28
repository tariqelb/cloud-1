SRC = ./docker-compose.yml

HOME_DIR = $(HOME)

all:
	mkdir -p $(HOME_DIR)/cloud-1-volume
	mkdir -p $(HOME_DIR)/cloud-1-volume/wp $(HOME_DIR)/cloud-1-volume/db
	docker-compose -f $(SRC) up -d

clean:
	docker-compose -f $(SRC) down
#To remove image also
#	docker-compose -f $(SRC) down --rmi all

fclean: clean
	rm -rf $(HOME_DIR)/cloud-1-volume
	docker volume rm app_cloud-1-db-vol app_cloud-1-wp-vol
#	docker system prune -a -f

re: fclean all

