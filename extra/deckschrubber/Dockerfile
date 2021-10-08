FROM golang:1.17 as build
ENV CGO_ENABLED=0
RUN go install github.com/fraunhoferfokus/deckschrubber@latest

FROM debian:10-slim
COPY --from=build /go/bin/deckschrubber /usr/local/bin
