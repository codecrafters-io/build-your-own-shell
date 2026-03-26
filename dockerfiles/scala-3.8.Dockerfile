FROM eclipse-temurin:25-jdk-alpine-3.23

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="scala-cli.yml"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN apk add --no-cache bash curl git && \
    curl -fsSL https://github.com/VirtusLab/scala-cli/releases/download/v1.12.5/scala-cli-x86_64-pc-linux-mostly-static.gz | gzip -d > /usr/local/bin/scala-cli && \
    chmod +x /usr/local/bin/scala-cli

WORKDIR /app

COPY . /app

RUN .codecrafters/compile.sh && rm -rf .scala-build .bsp