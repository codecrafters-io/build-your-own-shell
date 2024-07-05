#!/bin/sh
#
# This script is used to compile your program on CodeCrafters
# 
# This runs before .codecrafters/run.sh
#
# Learn more: codecrafters.io/program-interface

# Exit early if any commands fail
set -e

cargo build \
    --quiet \
    --release \
    --target-dir=/tmp/codecrafters-shell-target \
    --manifest-path Cargo.toml
