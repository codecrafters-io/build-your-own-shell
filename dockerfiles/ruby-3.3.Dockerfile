FROM ruby:3.3-alpine

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="Gemfile,Gemfile.lock"
WORKDIR /app

COPY Gemfile Gemfile.lock ./

# Install build dependencies (for native extensions)
RUN apk add --no-cache build-base=0.5-r3

# Install dependencies
RUN bundle install --verbose