# syntax=docker/dockerfile:1.7-labs
FROM eclipse-temurin:25-jdk-alpine-3.23

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="scala-cli.yml"

RUN apk add --no-cache bash=5.3.3-r1 curl

SHELL ["/bin/bash", "-e", "-o", "pipefail", "-c"]

RUN curl https://raw.githubusercontent.com/VirtusLab/scala-cli/refs/tags/v1.12.5/scala-cli.sh > /usr/local/bin/scala-cli && \
    chmod +x /usr/local/bin/scala-cli
    
WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

RUN .codecrafters/compile.sh