#!/bin/sh
#
# This script is used to compile your program on CodeCrafters
# 
# This runs before .codecrafters/run.sh
#
# Learn more: <insert-link>

go build -o /tmp/shell-target cmd/myshell/*.go
