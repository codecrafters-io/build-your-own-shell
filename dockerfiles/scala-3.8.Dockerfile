FROM eclipse-temurin:25-jdk-alpine-3.23

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="scala-cli.yml"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk add --no-cache --upgrade bash=5.3.3-r1 && \
    curl -fsSL https://github.com/VirtusLab/scala-cli/releases/latest/download/scala-cli-x86_64-pc-linux-static.gz | gzip -d > /usr/local/bin/scala-cli && \
    chmod +x /usr/local/bin/scala-cli

WORKDIR /app

COPY . /app

RUN .codecrafters/compile.sh