# syntax=docker/dockerfile:1.7-labs
# TODO: Is there a way to avoid using edge here?
FROM alpine:edge

# Add the testing repository
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="build.zig,build.zig.zon"

# Update the package list and install Zig
RUN apk add --no-cache zig@community=0.13.0-r0

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# This runs zig build
RUN .codecrafters/compile.sh

# Once the heavy steps are done, we can copy all files back
COPY . /app