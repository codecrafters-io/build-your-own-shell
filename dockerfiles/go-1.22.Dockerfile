FROM golang:1.22-alpine

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="go.mod,go.sum"

# By default, Go uses $HOME for GOCACHE. We need to override $HOME in some tests,
# so let's ensure Go uses a different directory for caching.
RUN mkdir -p /cache
ENV GOCACHE=/cache

WORKDIR /app

COPY go.mod go.sum ./

# Starting from Go 1.20, the go standard library is no loger compiled
# setting the GODEBUG environment to "installgoroot=all" restores the old behavior
RUN GODEBUG="installgoroot=all" go install std

RUN go mod download
