TERGUM_VERSION=v0.21.0
IMAGE=sikalabs/extra:tergum-$(TERGUM_VERSION)-with-mongodump-mysqldump

all: build push

build:
	docker build -t ${IMAGE} --build-arg TERGUM_VERSION=${TERGUM_VERSION} .

push:
	docker push ${IMAGE}
