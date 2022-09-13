all: build push

build:
	docker build --platform linux/amd64 -t sikalabs/awx-ee .

push:
	docker push sikalabs/awx-ee
