#!/bin/sh
#
# This script is used to run your program on CodeCrafters
# 
# This runs after .codecrafters/compile.sh
#
# Learn more: https://codecrafters.io/program-interface

# Exit early if any commands fail
set -e

NODE_PATH="$(dirname "$0")/node_modules" \
exec node "$(dirname "$0")/app/main.js" "$@"
