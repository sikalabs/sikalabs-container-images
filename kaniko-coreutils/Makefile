BASE_IMAGE=gcr.io/kaniko-project/executor:v1.23.2-debug
IMAGE_TAG_SUFFIX=":0.1.0"

all: build push

build:
	docker build --platform linux/amd64 --build-arg BASE_IMAGE=$(BASE_IMAGE) -t sikalabs/kaniko-coreutils$(IMAGE_TAG_SUFFIX) . $(ARGS)

push:
	docker push sikalabs/kaniko-coreutils$(IMAGE_TAG_SUFFIX)

	docker tag sikalabs/kaniko-coreutils$(IMAGE_TAG_SUFFIX) ghcr.io/sikalabs/kaniko-coreutils$(IMAGE_TAG_SUFFIX)
	docker push ghcr.io/sikalabs/kaniko-coreutils$(IMAGE_TAG_SUFFIX)
