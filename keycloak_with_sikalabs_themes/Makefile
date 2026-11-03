BASE_IMAGE_NAME=quay.io/keycloak/keycloak
BASE_TAG=26.8.1
IMAGE=sikalabs/keycloak-with-sikalabs-themes

default: build-push

build-push:
	@make _build
	@make _push

build-push-all:
	@make build-push
	@make build-push BASE_TAG=26.3.3

_build:
	docker build --platform linux/amd64 --build-arg BASE_IMAGE=$(BASE_IMAGE_NAME):$(BASE_TAG) -t $(IMAGE):$(BASE_TAG) -t ghcr.io/$(IMAGE):$(BASE_TAG) . $(ARGS)

_push:
	docker push $(IMAGE):$(BASE_TAG)
	docker push ghcr.io/$(IMAGE):$(BASE_TAG)
