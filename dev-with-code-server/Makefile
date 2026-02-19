all: build push

build:
	docker build --platform linux/amd64 -t ghcr.io/sikalabs/dev-with-code-server . $(ARGS)

push:
	docker push sikalabs/dev-with-code-server

	docker tag ghcr.io/sikalabs/dev-with-code-server sikalabs/dev-with-code-server
	docker push sikalabs/dev-with-code-server

dev:
	docker run -ti ghcr.io/sikalabs/dev-with-code-server
