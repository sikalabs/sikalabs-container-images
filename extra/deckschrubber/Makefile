IMAGE=sikalabs/extra:deckschrubber

all: build push

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}
