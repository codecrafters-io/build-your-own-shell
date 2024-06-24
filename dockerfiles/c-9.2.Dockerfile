FROM alpine:3.19

RUN apk update && \
    apk add --no-cache "gcc>=13" && \
    apk add --no-cache "musl-dev>=1.2"

# We need to install Go to build the custom executable.
RUN apk add --no-cache "go>=1.21"
