FROM eclipse-temurin:24-jdk-alpine

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="src/main/scala/codecrafters_shell/App.scala"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN apk add --no-cache bash curl git && \
    curl -fsSL https://github.com/VirtusLab/scala-cli/releases/latest/download/scala-cli-x86_64-pc-linux-static.gz | gzip -d > /usr/local/bin/scala-cli && \
    chmod +x /usr/local/bin/scala-cli

WORKDIR /app

COPY . /app

# Pre-fetch dependencies, then clean build artifacts to keep layer small
RUN .codecrafters/compile.sh && rm -rf .scala-build .bsp