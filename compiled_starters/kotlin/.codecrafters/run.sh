#!/bin/sh
#
# This script is used to run your program on CodeCrafters
#
# This runs after .codecrafters/compile.sh
#
# Learn more: https://codecrafters.io/program-interface

set -e # Exit on failure

LIBS_DIR="/tmp/codecrafters-kotlin-libs"
CLASSES_DIR="/tmp/codecrafters-build-shell-kotlin/classes"

if [ -f "$CLASSES_DIR/AppKt.class" ]; then
    exec java -cp "$CLASSES_DIR:$LIBS_DIR/*" AppKt "$@"
else
    exec /tmp/codecrafters-build-shell-kotlin/install/app/bin/app "$@"
fi
