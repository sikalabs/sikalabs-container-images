TERRAFORM_IMAGE_VERSION=1.4
IMAGE=sikalabs/terraform-with-random-provider:${TERRAFORM_IMAGE_VERSION}

all: build push

build:
	docker build . --platform linux/amd64 -t ${IMAGE}

push:
	docker push ${IMAGE}

run-example:
	cd example && \
		docker build --platform linux/amd64 -t terraform-with-random-provider-example . && \
		docker run --rm --net none terraform-with-random-provider-example
