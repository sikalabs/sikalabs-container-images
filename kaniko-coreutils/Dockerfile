ARG TOOLS_BASE_IMAGE=alpine:3.20
ARG BASE_IMAGE=gcr.io/kaniko-project/executor:v1.23.2-debug

FROM $TOOLS_BASE_IMAGE AS tools
RUN apk add --no-cache git

FROM $BASE_IMAGE
COPY --from=tools /usr/bin/git /usr/bin/

RUN for cmd in cat echo mkfifo; do \
        ln -s /busybox/busybox /usr/bin/$cmd && \
        ln -s /busybox/busybox /bin/$cmd ; \
    done \
 && ln -s /usr/bin/git /bin/git \
 && ln -sf /busybox/sh /bin/sh

ENTRYPOINT ["/bin/sh","-c"]
