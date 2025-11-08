all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/pause -t ghcr.io/sikalabs/pause .

push:
	docker push sikalabs/pause
	docker push ghcr.io/sikalabs/pause
