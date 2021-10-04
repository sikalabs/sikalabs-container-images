IMAGE=sikalabs/extra:tergum-with-mongodump-mysqldump

all: build push

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}
