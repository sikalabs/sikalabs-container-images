ARG BASE_IMAGE=ghcr.io/sikalabs/ci
FROM $BASE_IMAGE
RUN apt-get update && \
  apt-get install -y --no-install-recommends awscli && \
  rm -rf /var/lib/apt/lists/*
