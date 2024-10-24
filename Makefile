build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up: 
	docker-compose up -d
composer-update:
	docker exec laravel-auth bash -c "composer update"
migrate-seed:
	docker exec laravel-auth bash -c "php artisan migrate"
	docker exec laravel-auth bash -c "php artisan db:seed"
serve:
	docker exec laravel-auth bash -c "php artisan serve"