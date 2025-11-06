all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/dev:claude -t ghcr.io/sikalabs/dev:claude . $(ARGS)

push:
	docker push sikalabs/dev:claude
	docker push ghcr.io/sikalabs/dev:claude

dev:
	docker run -ti sikalabs/dev:claude
