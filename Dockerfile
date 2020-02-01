FROM golang:1.13.6-alpine3.11 as build

ENV GO111MODULE=on

WORKDIR /go/src/github.com/kyohei0423/buppan-api
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    git \
    curl \
    bash \
    gcc \
    musl-dev && \
    go get github.com/pilu/fresh && \
    go get -tags 'mysql' -u github.com/golang-migrate/migrate/v4/cmd/migrate && \
    go get -u github.com/go-delve/delve/cmd/dlv
