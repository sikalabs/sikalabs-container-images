TERGUM_VERSION=v0.12.0
IMAGE=sikalabs/tergum-with:mysqldump

all: build push

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}
