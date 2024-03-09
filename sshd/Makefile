DOCKERHUB_IMAGE = sikalabs/sshd
GITHUB_IMAGE = ghcr.io/sikalabs/sshd

all: build push

build:
	docker build --platform linux/amd64 -t $(DOCKERHUB_IMAGE) -t $(GITHUB_IMAGE) . $(ARGS)

push:
	docker push $(DOCKERHUB_IMAGE)
	docker push $(GITHUB_IMAGE)

run:
	docker run --name sshd -d -p 2222:22 $(DOCKERHUB_IMAGE)

test:
	ssh \
		-o UserKnownHostsFile=/dev/null \
		-o StrictHostKeyChecking=no \
		ssh://root@127.0.0.1:2222 \
		cat /etc/hostname
