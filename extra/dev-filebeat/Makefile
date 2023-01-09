all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/dev-filebeat . $(ARGS)

push:
	docker push sikalabs/dev-filebeat
