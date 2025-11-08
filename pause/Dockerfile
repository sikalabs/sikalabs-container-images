FROM golang:1.25 AS build
WORKDIR /build
COPY pause.go .
RUN CGO_ENABLED=0 go build pause.go

FROM scratch
LABEL org.opencontainers.image.source=https://github.com/sikalabs/sikalabs-container-images
COPY --from=build /build/pause .
CMD ["/pause"]
