#!/bin/sh
#
# This script is used to run your program on CodeCrafters
# 
# This runs after .codecrafters/compile.sh
#
# Learn more: <insert-link>

exec java -jar /tmp/codecrafters-shell-target/java_shell.jar "$@"
