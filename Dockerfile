FROM debian:9
MAINTAINER Ondrej Sika <ondrej@ondrejsika.com>
RUN apt update && apt install -y \
    openssh-client sshpass \
    curl \
    wget \
    git
RUN echo "alias ssh='sshpass -e ssh -o StrictHostKeyChecking=no '" >> /etc/bash.bashrc
ENV DOCKERVERSION=17.12.0-ce
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && mv docker-${DOCKERVERSION}.tgz docker.tgz \
  && tar xzvf docker.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker.tgz

# Minio CLient (mc -> mcli)
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && \
    mv mc /usr/local/bin/mcli && \
    chmod +x /usr/local/bin/mcli
