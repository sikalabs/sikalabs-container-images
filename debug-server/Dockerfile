FROM golang:1.17 AS build
WORKDIR /build
COPY debug-server.go .
ENV CGO_ENABLED=0
RUN go build debug-server.go

FROM scratch
COPY --from=build /build/debug-server .
CMD ["/debug-server"]
EXPOSE 80
