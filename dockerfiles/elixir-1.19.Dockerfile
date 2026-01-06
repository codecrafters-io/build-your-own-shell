# syntax=docker/dockerfile:1.7-labs
FROM elixir:1.19.4-alpine

RUN apk add --no-cache 'xz>=5.6' 'curl>=8.9' 'readline-dev>=8.2' 'musl-dev>=1.2' 'ncurses-dev>=6.4'

# Ensures the container is re-built if dependency files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="mix.exs"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# install hex + rebar
RUN mix local.hex --force && \
  mix local.rebar --force

# install and compile mix dependencies
RUN mix deps.get && \
  mix deps.compile

# Install & cache deps
RUN .codecrafters/compile.sh

RUN mkdir -p /app-cached
RUN if [ -d "/app/_build" ]; then mv /app/_build /app-cached; fi
RUN if [ -d "/app/deps" ]; then mv /app/deps /app-cached; fi
