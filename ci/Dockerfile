ARG BASE_IMAGE=debian:12-slim
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
  postgresql-client \
  # required by aws cli
  less groff && \
  rm -rf /var/lib/apt/lists/* && \
  update-ca-certificates
RUN curl -fsSL https://raw.githubusercontent.com/sikalabs/slu/master/install.sh | sudo sh

# Docker
FROM base as docker
RUN slu install-bin docker

# Docker Compose
FROM base as docker_compose
RUN slu install-bin docker-compose

# Minio Client (mc -> mcli)
FROM base as minio
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && \
  mv mc /usr/local/bin/mcli && \
  chmod +x /usr/local/bin/mcli

# kubectl
FROM base as kubectl
RUN slu install-bin kubectl

# helm
FROM base as helm
RUN slu install-bin helm

# terraform
FROM base as terraform
RUN slu install-bin terraform

# vault
FROM base as vault
RUN slu install-bin vault

# doctl
FROM base as doctl
RUN slu install-bin doctl

# skaffold
FROM base as skaffold
RUN slu install-bin skaffold

# crane
FROM base as crane
RUN slu install-bin crane

FROM base as argocd
RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && \
  chmod +x /usr/local/bin/argocd

FROM base as gitlab-terraform
RUN curl -sSL -o /usr/local/bin/gitlab-terraform \
  https://gitlab.com/gitlab-org/terraform-images/-/raw/master/src/bin/gitlab-terraform.sh && \
  chmod +x /usr/local/bin/gitlab-terraform

FROM base as git-repo-sync.sh
RUN curl -sSL -o /usr/local/bin/git-repo-sync.sh \
  https://raw.githubusercontent.com/sikalabs/git-repo-sync.sh/master/git-repo-sync.sh && \
  chmod +x /usr/local/bin/git-repo-sync.sh

# Final Image
FROM base
LABEL org.opencontainers.image.source https://github.com/sikalabs/sikalabs-container-images
# Install aws cli v2
RUN apt-get update && \
  apt-get install -y --no-install-recommends awscli && \
  rm -rf /var/lib/apt/lists/*
# TODO: Install from tar.gz
RUN curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh
COPY --from=docker /usr/local/bin/docker /usr/local/bin
COPY --from=docker_compose /usr/local/bin/docker-compose /usr/local/bin
COPY --from=minio /usr/local/bin/mcli /usr/local/bin
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin
COPY --from=helm /usr/local/bin/helm /usr/local/bin
COPY --from=terraform /usr/local/bin/terraform /usr/local/bin
COPY --from=vault /usr/local/bin/vault /usr/local/bin
COPY --from=doctl /usr/local/bin/doctl /usr/local/bin
COPY --from=skaffold /usr/local/bin/skaffold /usr/local/bin
COPY --from=argocd /usr/local/bin/argocd /usr/local/bin
COPY --from=crane /usr/local/bin/crane /usr/local/bin
COPY --from=gitlab-terraform /usr/local/bin/gitlab-terraform /usr/local/bin/gitlab-terraform
COPY --from=git-repo-sync.sh /usr/local/bin/git-repo-sync.sh /usr/local/bin/git-repo-sync.sh
COPY --from=vojtechmares/statica:latest-stable /statica /usr/local/bin
RUN slu install-bin editorconfig-checker
RUN slu install-bin slr
