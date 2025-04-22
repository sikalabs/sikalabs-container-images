ARG BASE_IMAGE=debian:bookworm-slim
ARG KANIKO_IMAGE=gcr.io/kaniko-project/executor:v1.23.2-debug

FROM $KANIKO_IMAGE AS kaniko-src

FROM $BASE_IMAGE AS kaniko-debian
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        openssh-client \
        ca-certificates \
        coreutils \
        unzip \
        busybox && \
    rm -rf /var/lib/apt/lists/*

COPY --from=kaniko-src /kaniko /kaniko

ENV PATH="/kaniko:${PATH}"

ENTRYPOINT ["/bin/sh", "-c"]
