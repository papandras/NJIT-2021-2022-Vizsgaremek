copy .env.example .env
docker-compose up -d
docker-compose exec php composer install
docker-compose exec php php artisan key:generate
docker-compose exec php php artisan migrate
docker-compose exec php php artisan storage:link
php artisan make:mail OrderShipped