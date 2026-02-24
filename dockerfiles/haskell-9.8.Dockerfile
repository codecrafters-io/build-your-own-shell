# syntax=docker/dockerfile:1.7-labs
FROM haskell:9.8.4-bullseye

# Ensures the container is re-built if dependency files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="stack.yaml,package.yaml,stack.yaml.lock"

RUN mkdir -p /etc/stack && \
    echo "allow-different-user: true" >> /etc/stack/config.yaml && \
    echo "install-ghc: false" >> /etc/stack/config.yaml && \
    echo "system-ghc: true" >> /etc/stack/config.yaml

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

ENV STACK_ROOT=/app/.stack
RUN stack build && \
    stack clean codecrafters-shell && \
    mkdir /app-cached && \
    mv .stack-work /app-cached/.stack-work && \
    mv .stack /app-cached/.stack && \
    rm -rf /app/app
