#!/bin/sh
#
# This script is used to run your program on CodeCrafters
# 
# This runs after .codecrafters/compile.sh
#
# Learn more: codecrafters.io/program-interface

# Exit early if any commands fail
set -e

exec "/tmp/codecrafters-shell-target/release/shell-starter-rust" "$@"
