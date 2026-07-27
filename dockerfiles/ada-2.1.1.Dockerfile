# syntax=docker/dockerfile:1.7-labs
FROM gcc:15.2.0-trixie

ENV DEBIAN_FRONTEND=noninteractive
ENV ALIRE_VERSION=2.1.1
ARG TARGETARCH

# Ensures the container is re-built if dependency files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="alire.toml,codecrafters_shell.gpr"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnat \
    gprbuild \
    make \
    unzip \
    xz-utils \
 && rm -rf /var/lib/apt/lists/*

RUN case "$TARGETARCH" in \
      amd64) alire_arch=x86_64 ;; \
      arm64) alire_arch=aarch64 ;; \
      *) echo "Unsupported architecture: $TARGETARCH" >&2; exit 1 ;; \
    esac \
 && curl -fsSL "https://github.com/alire-project/alire/releases/download/v${ALIRE_VERSION}/alr-${ALIRE_VERSION}-bin-${alire_arch}-linux.zip" -o /tmp/alr.zip \
 && unzip /tmp/alr.zip -d /opt/alire \
 && ln -s /opt/alire/bin/alr /usr/local/bin/alr \
 && rm /tmp/alr.zip

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

RUN alr toolchain --select gnat_external gprbuild
RUN alr build

