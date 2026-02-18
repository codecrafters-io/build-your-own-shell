#!/bin/sh
#
# This script is used to compile your program on CodeCrafters
#
# This runs before .codecrafters/run.sh
#
# Learn more: https://codecrafters.io/program-interface

set -e # Exit on failure

LIBS_DIR="/tmp/codecrafters-kotlin-libs"
CLASSES_DIR="/tmp/codecrafters-build-shell-kotlin/classes"

if [ -d "$LIBS_DIR" ] && [ "$(ls -A "$LIBS_DIR" 2>/dev/null)" ] && command -v kotlinc >/dev/null 2>&1; then
    # Fast path: compile with kotlinc using pre-cached libraries
    mkdir -p "$CLASSES_DIR"
    CP=$(echo "$LIBS_DIR"/*.jar | tr ' ' ':')
    kotlinc -cp "$CP" -d "$CLASSES_DIR" app/src/main/kotlin/*.kt
else
    # Full build: use Gradle to build and install distribution
    gradle installDist

    # Cache library jars for fast recompilation on subsequent runs
    mkdir -p "$LIBS_DIR"
    for f in /tmp/codecrafters-build-shell-kotlin/install/app/lib/*.jar; do
        [ "$(basename "$f")" != "app.jar" ] && cp "$f" "$LIBS_DIR/"
    done
fi
