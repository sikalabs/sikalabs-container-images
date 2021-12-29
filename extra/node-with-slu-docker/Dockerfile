ARG VERSION=16
FROM node:$VERSION
COPY --from=sikalabs/slu:v0.26.0 /usr/local/bin/slu /usr/local/bin
COPY --from=sikalabs/ci /usr/local/bin/docker /usr/local/bin
