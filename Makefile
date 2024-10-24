build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
down:
	docker-compose down	
up: 
	docker-compose up -d
composer-update:
	docker exec laravel-auth bash -c "composer update"
migrate-seed:
	docker exec laravel-auth bash -c "php artisan migrate"
	docker exec laravel-auth bash -c "php artisan db:seed"
serve:
	docker exec laravel-auth bash -c "php artisan serve"

# First-Time-Setup Commands
initial-commands:
	@make build
	@make up
	@make composer-update
	@make migrate-seed