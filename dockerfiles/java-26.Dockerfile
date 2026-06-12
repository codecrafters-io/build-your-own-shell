# syntax=docker/dockerfile:1.7-labs
FROM maven:3.9.16-eclipse-temurin-26-alpine

# Ensures the container is re-built if dependency files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="pom.xml"
ENV MAVEN_OPTS="--sun-misc-unsafe-memory-access=allow"

RUN apk add --no-cache --upgrade 'bash>=5.2'

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Install language-specific dependencies
RUN .codecrafters/compile.sh
