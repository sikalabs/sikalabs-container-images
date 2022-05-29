FROM debian:11-slim
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  && \
  rm -rf /var/lib/apt/lists/*
