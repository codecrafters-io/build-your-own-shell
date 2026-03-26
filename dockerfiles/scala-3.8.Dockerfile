# syntax=docker/dockerfile:1.7-labs
FROM sbtscala/scala-sbt:eclipse-temurin-alpine-25.0.1_8_1.12.8_3.8.2

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="build.sbt,project/assembly.sbt,project/build.properties"

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

WORKDIR /app

RUN .codecrafters/compile.sh