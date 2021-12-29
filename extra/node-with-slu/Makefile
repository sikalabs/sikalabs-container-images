IMAGE=sikalabs/extra:node-with-slu

all: build push

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}
