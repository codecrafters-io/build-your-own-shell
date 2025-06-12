# syntax=docker/dockerfile:1.7-labs
FROM php:8.4-cli-alpine3.22

# For ext-sockets installation
RUN apk add linux-headers=6.6-r0 --no-cache

RUN docker-php-ext-install pcntl sockets
