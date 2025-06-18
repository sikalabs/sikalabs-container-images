IMAGE=ghcr.io/sikalabs/debian-with-argo-rollouts

all: build push

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}

push-github:
	docker push ${IMAGE}
