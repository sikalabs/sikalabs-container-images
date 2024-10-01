all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/dev . $(ARGS)

push:
	docker push sikalabs/dev

	docker tag sikalabs/dev ghcr.io/sikalabs/dev
	docker push ghcr.io/sikalabs/dev

dev:
	docker run -ti sikalabs/dev
