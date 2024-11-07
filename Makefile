build:
	docker-compose build --no-cache --force-rmdocker-compose exec <service_name> php -m | grep intl

stop:
	docker-compose stop
down:
	docker-compose down	
up: 
	docker-compose up --build -d
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

# docker exec -it laravel-auth bash

# dalsukh bhai gohil timba // composer require filament/filament