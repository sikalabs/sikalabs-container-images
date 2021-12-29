IMAGE=sikalabs/extra:node-with-slu-docker

all: build push

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}
