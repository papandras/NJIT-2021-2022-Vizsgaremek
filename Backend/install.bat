copy .env.example .env
docker-compose up -d
docker-compose exec php composer install
docker-compose exec php php artisan key:generate
docker-compose exec php php artisan storage:link
docker-compose exec php php artisan make:mail OrderShipped
md storage\app\profilpic
copy public\base-notfound.svg storage\app\profilpic
md storage\app\storage
copy public\files.zip storage\app\storage
cd storage\app\storage
tar -xf files.zip