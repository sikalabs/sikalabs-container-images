FROM debian:12-slim
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ca-certificates && \
  rm -rf /var/lib/apt/lists/* && \
  update-ca-certificates
