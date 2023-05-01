TERRAFORM_IMAGE_VERSION=1.4
IMAGE=sikalabs/terraform-with-keycloak-provider:${TERRAFORM_IMAGE_VERSION}

all: build push

build:
	docker build . --platform linux/amd64 -t ${IMAGE}

push:
	docker push ${IMAGE}
