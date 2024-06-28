# syntax=docker/dockerfile:1.7-labs
FROM oven/bun:1.1.4-alpine

# We need to install Go to build the custom executable.
RUN apk add --no-cache "go>=1.20"

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="package.json,bun.lockb"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# For reproducible builds.
# This will install the exact versions of each package specified in the lockfile.
# If package.json disagrees with bun.lockb, Bun will exit with an error. The lockfile will not be updated.
RUN bun install --frozen-lockfile

RUN mkdir -p /app-cached
# If the node_modules directory exists, move it to /app-cached
RUN if [ -d "/app/node_modules" ]; then mv /app/node_modules /app-cached; fi
# Once the heave steps are done, we can copy all files back
COPY . /app
