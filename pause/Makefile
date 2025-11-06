all: build push

build:
	docker build -t sikalabs/pause -t ghcr.io/sikalabs/pause .

push:
	docker push sikalabs/pause
	docker push ghcr.io/sikalabs/pause
