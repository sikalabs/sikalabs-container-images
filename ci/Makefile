BASE_IMAGE=debian:12-slim
IMAGE_TAG_SUFFIX=

all: build push

build:
	docker build --platform linux/amd64 --build-arg BASE_IMAGE=$(BASE_IMAGE) -t sikalabs/ci$(IMAGE_TAG_SUFFIX) . $(ARGS)

push:
	docker push sikalabs/ci$(IMAGE_TAG_SUFFIX)

	docker tag sikalabs/ci$(IMAGE_TAG_SUFFIX) ondrejsika/ci$(IMAGE_TAG_SUFFIX)
	docker push ondrejsika/ci$(IMAGE_TAG_SUFFIX)

	docker tag sikalabs/ci$(IMAGE_TAG_SUFFIX) ghcr.io/sikalabs/ci$(IMAGE_TAG_SUFFIX)
	docker push ghcr.io/sikalabs/ci$(IMAGE_TAG_SUFFIX)
