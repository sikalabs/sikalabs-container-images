TERGUM_VERSION=v0.12.0
IMAGE=sikalabs/tergum-with:pg-dump

all: build push

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}
