FROM debian:buster-slim as base

RUN apt update && \
    apt install -y \
      ca-certificates \
      openssh-client sshpass \
      zip unzip \
      curl \
      wget \
      jq \
      git && \
    update-ca-certificates

COPY sshx /usr/local/bin/

# Docker
FROM base as docker
ENV DOCKER_VERSION=19.03.1
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && mv docker-${DOCKER_VERSION}.tgz docker.tgz \
  && tar xzvf docker.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker.tgz

# Docker Compose
FROM base as docker_compose
ENV DOCKER_COMPOSE_VERSION=1.24.1
RUN curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

# Docker Machine
FROM base as docker_machine
ENV DOCKER_MACHINE_VERSION=v0.16.1
RUN base=https://github.com/docker/machine/releases/download/$DOCKER_MACHINE_VERSION && \
    curl -L $base/docker-machine-$(uname -s)-$(uname -m) > /tmp/docker-machine && \
    install /tmp/docker-machine /usr/local/bin/docker-machine

# Minio Client (mc -> mcli)
FROM base as minio
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && \
    mv mc /usr/local/bin/mcli && \
    chmod +x /usr/local/bin/mcli

# kubectl
FROM base as kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin

# helm
FROM base as helm
ENV HELM_VERSION=v3.0.2
RUN curl -fsSL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -o helm.tar.gz \
  && tar xzvf helm.tar.gz \
  && mv linux-amd64/helm /usr/local/bin \
  && rm -r linux-amd64 helm.tar.gz

# terraform
FROM base as terraform
ENV TERRAFORM_VERSION=0.12.6
RUN curl -fsSL https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
  && unzip terraform.zip \
  && mv terraform /usr/local/bin \
  && rm -r terraform.zip

# consul
FROM base as consul
ENV CONSUL_VERSION=1.5.3
RUN curl -fsSL https://releases.hashicorp.com/consul/$CONSUL_VERSION/consul_${CONSUL_VERSION}_linux_amd64.zip -o consul.zip \
  && unzip consul.zip \
  && mv consul /usr/local/bin \
  && rm -r consul.zip

# vault
FROM base as vault
ENV VAULT_VERSION=1.2.1
RUN curl -fsSL https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -o vault.zip \
  && unzip vault.zip \
  && mv vault /usr/local/bin \
  && rm -r vault.zip

# doctl
FROM base as doctl
ENV DOCTL_VERSION=1.37.0
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz | tar xz && \
  mv doctl /usr/local/bin

# Final Image
FROM base
COPY --from=docker /usr/local/bin/docker /usr/local/bin
COPY --from=docker_compose /usr/local/bin/docker-compose /usr/local/bin
COPY --from=docker_machine /usr/local/bin/docker-machine /usr/local/bin
COPY --from=minio /usr/local/bin/mcli /usr/local/bin
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin
COPY --from=helm /usr/local/bin/helm /usr/local/bin
COPY --from=terraform /usr/local/bin/terraform /usr/local/bin
COPY --from=consul /usr/local/bin/consul /usr/local/bin
COPY --from=vault /usr/local/bin/vault /usr/local/bin
COPY --from=doctl /usr/local/bin/doctl /usr/local/bin
