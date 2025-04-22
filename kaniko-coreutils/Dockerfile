ARG BASE_IMAGE=gcr.io/kaniko-project/executor:v1.23.2-debug
FROM $BASE_IMAGE as base

RUN apk add --no-cache coreutils bash git \
    && ln -sf /usr/bin/mkfifo /bin/mkfifo  \
    && ln -sf /usr/bin/echo   /bin/echo \
    && ln -sf /usr/bin/git    /bin/git \

RUN ln -sf /busybox/sh /bin/sh

ENTRYPOINT ["/bin/sh", "-c"]
