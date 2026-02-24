# syntax=docker/dockerfile:1.7-labs
FROM dart:3.11.0

# Ensures the container is re-built if dependency files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="pubspec.yaml,pubspec.lock"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

RUN dart pub get
