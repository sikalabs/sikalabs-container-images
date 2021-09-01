IMAGE=sikalabs/extra:node-with-statica

all: build push

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}
