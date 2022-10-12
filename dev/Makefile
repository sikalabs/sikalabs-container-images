all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/dev .

push:
	docker push sikalabs/dev
