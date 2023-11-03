all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/tailscale . $(ARGS)

push:
	docker push sikalabs/tailscale

dev:
	docker run -ti sikalabs/tailscale
