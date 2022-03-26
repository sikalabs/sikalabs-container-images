ARG BASE_IMAGE=debian:11-slim
FROM $BASE_IMAGE as base

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ca-certificates \
  openssh-client sshpass \
  zip unzip \
  curl \
  wget \
  host \
  jq \
  make \
  sudo \
  moreutils \
  git \
  gnupg2 \
  # required by aws cli
  less groff && \
  rm -rf /var/lib/apt/lists/* && \
  update-ca-certificates

# Docker
FROM base as docker
ENV DOCKER_VERSION=19.03.12
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && mv docker-${DOCKER_VERSION}.tgz docker.tgz \
  && tar xzvf docker.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker.tgz

# Docker Compose
FROM base as docker_compose
ENV DOCKER_COMPOSE_VERSION=1.26.2
RUN curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

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
ENV HELM_VERSION=v3.7.1
RUN curl -fsSL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -o helm.tar.gz \
  && tar xzvf helm.tar.gz \
  && mv linux-amd64/helm /usr/local/bin \
  && rm -r linux-amd64 helm.tar.gz

# terraform
FROM base as terraform
ENV TERRAFORM_VERSION=0.13.2
RUN curl -fsSL https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
  && unzip terraform.zip \
  && mv terraform /usr/local/bin \
  && rm -r terraform.zip

# consul
FROM base as consul
ENV CONSUL_VERSION=1.7.2
RUN curl -fsSL https://releases.hashicorp.com/consul/$CONSUL_VERSION/consul_${CONSUL_VERSION}_linux_amd64.zip -o consul.zip \
  && unzip consul.zip \
  && mv consul /usr/local/bin \
  && rm -r consul.zip

# vault
FROM base as vault
ENV VAULT_VERSION=1.5.3
RUN curl -fsSL https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -o vault.zip \
  && unzip vault.zip \
  && mv vault /usr/local/bin \
  && rm -r vault.zip

# doctl
FROM base as doctl
ENV DOCTL_VERSION=1.37.0
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz | tar xz && \
  mv doctl /usr/local/bin

# skaffold
FROM base as skaffold
RUN curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
  sudo install skaffold /usr/local/bin/

# slu (SikaLabs Utils)
FROM base as slu
ENV slu_VERSION=v0.36.1
RUN wget https://github.com/sikalabs/slu/releases/download/${slu_VERSION}/slu_${slu_VERSION}_linux_amd64.tar.gz && \
  tar -xvzf slu_${slu_VERSION}_linux_amd64.tar.gz && \
  mv slu /usr/local/bin/

FROM base as argocd
RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && \
  chmod +x /usr/local/bin/argocd

# Final Image
FROM base
# Install aws cli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
  unzip -q awscliv2.zip && \
  ./aws/install && \
  rm -rf awscliv2.zip aws
COPY --from=docker /usr/local/bin/docker /usr/local/bin
COPY --from=docker_compose /usr/local/bin/docker-compose /usr/local/bin
COPY --from=minio /usr/local/bin/mcli /usr/local/bin
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin
COPY --from=helm /usr/local/bin/helm /usr/local/bin
COPY --from=terraform /usr/local/bin/terraform /usr/local/bin
COPY --from=consul /usr/local/bin/consul /usr/local/bin
COPY --from=vault /usr/local/bin/vault /usr/local/bin
COPY --from=doctl /usr/local/bin/doctl /usr/local/bin
COPY --from=skaffold /usr/local/bin/skaffold /usr/local/bin
COPY --from=slu /usr/local/bin/slu /usr/local/bin
COPY --from=argocd /usr/local/bin/argocd /usr/local/bin
COPY --from=vojtechmares/statica:latest-stable /statica /usr/local/bin
