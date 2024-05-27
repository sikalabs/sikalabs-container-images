IMAGE_DOCKER_HUB = "sikalabs/https-proxy-using-caddy"

all:
	@make docker-build
	@make docker-push

docker-build:
	docker build --platform linux/amd64 -t ${IMAGE_DOCKER_HUB} .

docker-push:
	docker push ${IMAGE_DOCKER_HUB}
