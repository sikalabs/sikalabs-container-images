all: build push

build:
	docker build \
		--platform linux/amd64 \
		-t ghcr.io/sikalabs/ci:aws \
		-t sikalabs/ci:aws \
		. $(ARGS)

push:
	docker push ghcr.io/sikalabs/ci:aws
	docker push sikalabs/ci:aws

dev:
	docker run -ti sikalabs/ci:aws
