TERGUM_VERSION=v0.21.0
IMAGE=sikalabs/extra:tergum-$(TERGUM_VERSION)-with-pgdump
IMAGE_GITHUB=ghcr.io/tergum-extra/tergum-with-pgdump:$(TERGUM_VERSION)

all: build push

build:
	docker build -t ${IMAGE} --build-arg TERGUM_VERSION=${TERGUM_VERSION} .

push:
	docker push ${IMAGE}

push-github:
	docker tag ${IMAGE} ${IMAGE_GITHUB}
	docker push ${IMAGE_GITHUB}
