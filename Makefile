all: build push

build:
	docker build -t ondrejsika/ci .

push:
	docker push ondrejsika/ci
