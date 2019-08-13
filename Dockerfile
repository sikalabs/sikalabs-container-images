FROM debian:9
RUN apt update && apt install -y \
    openssh-client sshpass \
    zip unzip \
    curl \
    wget \
    jq \
    git
COPY sshx /usr/local/bin/
ENV DOCKERVERSION=17.12.0-ce
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && mv docker-${DOCKERVERSION}.tgz docker.tgz \
  && tar xzvf docker.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker.tgz
RUN curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN base=https://github.com/docker/machine/releases/download/v0.14.0 && \
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
