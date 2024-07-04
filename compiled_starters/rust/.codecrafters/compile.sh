#!/bin/sh
#
# This script is used to compile your program on CodeCrafters
# 
# This runs before .codecrafters/run.sh
#
# Learn more: <insert-link>

cargo build \
    --quiet \
    --release \
    --target-dir=/tmp/codecrafters-shell-target \
    --manifest-path Cargo.toml
