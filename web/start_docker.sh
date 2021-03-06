IMAGE=$(docker ps -q --filter ancestor="docker-dash" )
if [ "$IMAGE" ]
then
	echo "FOUND"
	docker stop $IMAGE
	docker rm $IMAGE
fi

cp -r ../telemetry .
cp ../requirements_dev.txt .
docker build -t docker-dash .
docker run -d --restart unless-stopped -p 8050:8050 docker-dash
