#pushing docker images to docker hub
docker push razear/mega-electric-web-app:$SHA
docker push razear/mega-electric-web-app:latest

docker push razear/mega-electric-app:latest
docker push razear/mega-electric-app:$SHA

docker push razear/mega-electric-mysql:latest
docker push razear/mega-electric-mysql:$SHA

docker push razear/mega-electric-nginx:latest
docker push razear/mega-electric-nginx:$SHA

#deploying to fandogh cloud
fandogh service apply -f ./inventory-nginx/nginx-deployment.yml  -p SHA=$SHA
fandogh service apply -f ./invenory-mysql/mysql-deployment.yml -p SHA=$SHA
fandogh service apply -f ./inventory-web-app/web-app-deployment.yml   -p SHA=$SHA
fandogh service apply -f ./inventory-app/app-deployment.yml  -p SHA=$SHA