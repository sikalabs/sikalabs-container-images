all: build push

build:
	docker build -t sikalabs/ci .

push:
	docker push sikalabs/ci
