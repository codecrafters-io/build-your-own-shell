#!/bin/sh
#
# Use this script to run your program LOCALLY.
#
# Note: Changing this script WILL NOT affect how CodeCrafters runs your program.
#
# Learn more: https://codecrafters.io/program-interface

set -e # Exit early if any commands fail

# Copied from .codecrafters/compile.sh
#
# - Edit this to change how your program compiles locally
# - Edit .codecrafters/compile.sh to change how your program compiles remotely
(
  cd "$(dirname "$0")" # Ensure compile steps are run within the repository directory
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
)

# Copied from .codecrafters/run.sh
#
# - Edit this to change how your program runs locally
# - Edit .codecrafters/run.sh to change how your program runs remotely
LIBS_DIR="/tmp/codecrafters-kotlin-libs"
CLASSES_DIR="/tmp/codecrafters-build-shell-kotlin/classes"
if [ -d "$CLASSES_DIR" ]; then
    exec java -cp "$CLASSES_DIR:$LIBS_DIR/*" AppKt "$@"
else
    exec /tmp/codecrafters-build-shell-kotlin/install/app/bin/app "$@"
fi
