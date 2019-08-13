FROM debian:9

RUN apt update && apt install -y \
    openssh-client sshpass \
    zip unzip \
    curl \
    wget \
    jq \
    git

COPY sshx /usr/local/bin/

ENV DOCKER_VERSION=19.03.1
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && mv docker-${DOCKER_VERSION}.tgz docker.tgz \
  && tar xzvf docker.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker.tgz

ENV DOCKER_COMPOSE_VERSION=1.24.1
RUN curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

ENV DOCKER_MACHINE_VERSION=v0.16.1
RUN base=https://github.com/docker/machine/releases/download/$DOCKER_MACHINE_VERSION && \
    curl -L $base/docker-machine-$(uname -s)-$(uname -m) > /tmp/docker-machine && \
    install /tmp/docker-machine /usr/local/bin/docker-machine

# Minio CLient (mc -> mcli)
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && \
    mv mc /usr/local/bin/mcli && \
    chmod +x /usr/local/bin/mcli

# kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin

# helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash

# terraform
ENV TERRAFORM_VERSION=0.12.6
RUN curl -fsSL https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
  && unzip terraform.zip \
  && mv terraform /usr/local/bin \
  && rm -r terraform.zip
