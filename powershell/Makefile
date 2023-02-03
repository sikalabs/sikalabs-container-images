all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/powershell . $(ARGS)

push:
	docker push sikalabs/powershell
