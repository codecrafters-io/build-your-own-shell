# syntax=docker/dockerfile:1.7-labs
FROM maven:3.9.8-eclipse-temurin-22-alpine

# We need to install Go to build the custom executable.
RUN apk add --no-cache "go>=1.20"

# Ensures the container is re-built if pom.xml changes
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="pom.xml"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Cache dependencies
RUN mvn -B package -Ddir=/tmp/codecrafters-build-dir
