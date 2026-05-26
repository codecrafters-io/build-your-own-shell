#!/bin/sh
#
# This script is used to run your program on CodeCrafters
#
# This runs after .codecrafters/compile.sh
#
# Learn more: https://codecrafters.io/program-interface

set -e # Exit on failure

LIBS_DIR="/tmp/codecrafters-libs-shell-kotlin"
BUILD_DIR="/tmp/codecrafters-build-shell-kotlin"
KOTLIN_MAIN="$BUILD_DIR/classes/kotlin/main"
JVM_OPTS="--enable-native-access=ALL-UNNAMED --sun-misc-unsafe-memory-access=allow"

exec java $JVM_OPTS -cp "$KOTLIN_MAIN:$LIBS_DIR/*" AppKt "$@"
