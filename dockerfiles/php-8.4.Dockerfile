# syntax=docker/dockerfile:1.7-labs
FROM php:8.4-cli-alpine3.22

RUN docker-php-ext-install pcntl sockets
