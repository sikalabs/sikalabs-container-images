all: build push

build:
	docker build -t sikalabs/ci .

push:
	docker push sikalabs/ci
	docker tag sikalabs/ci ondrejsika/ci
	docker push ondrejsika/ci