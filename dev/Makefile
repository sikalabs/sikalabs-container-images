all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/dev . $(ARGS)

push:
	docker push sikalabs/dev

dev:
	docker run -ti sikalabs/dev
