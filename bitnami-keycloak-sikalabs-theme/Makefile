BASE_IMAGE_NAME=docker.io/bitnami/keycloak
BASE_TAG=26.3.3-debian-12-r0

default: build-push

build-push:
	@make _build
	@make _push

build-push-all:
	@make build-push
	@make build-push BASE_TAG=26.1.2-debian-12-r0
	@make build-push BASE_TAG=26.1.0-debian-12-r0
	@make build-push BASE_TAG=25.0.6-debian-12-r0
	@make build-push BASE_TAG=25.0.5-debian-12-r1
	@make build-push BASE_TAG=20.0.3-debian-11-r5

_build:
	docker build --platform linux/amd64 --build-arg BASE_IMAGE=$(BASE_IMAGE_NAME):$(BASE_TAG) -t sikalabs/bitnami-keycloak-sikalabs-theme:$(BASE_TAG) -t ghcr.io/sikalabs/bitnami-keycloak-sikalabs-theme:$(BASE_TAG) . $(ARGS)

_push:
	docker push sikalabs/bitnami-keycloak-sikalabs-theme:$(BASE_TAG)
	docker push ghcr.io/sikalabs/bitnami-keycloak-sikalabs-theme:$(BASE_TAG)
