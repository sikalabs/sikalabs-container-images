all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/dev:az -t ghcr.io/sikalabs/dev:az . $(ARGS)

push:
	docker push sikalabs/dev:az
	docker push ghcr.io/sikalabs/dev:az

dev:
	docker run -ti sikalabs/dev:az
