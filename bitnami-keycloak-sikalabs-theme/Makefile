BASE_IMAGE_NAME=docker.io/bitnami/keycloak
BASE_TAG=20.0.3-debian-11-r5

all: build push

build:
	docker build --platform linux/amd64 --build-arg BASE_IMAGE=$(BASE_IMAGE_NAME):$(BASE_TAG) -t sikalabs/bitnami-keycloak-sikalabs-theme:$(BASE_TAG) . $(ARGS)

push:
	docker push sikalabs/bitnami-keycloak-sikalabs-theme:$(BASE_TAG)
