#!/bin/sh
#
# Use this script to run your program LOCALLY.
#
# Note: Changing this script WILL NOT affect how CodeCrafters runs your program.
#
#
# Learn more: docs.codecrafters.io/program-interface

# Exit early if any commands fail
set -e

# Copied from .codecrafters/compile.sh
#
# - Edit this to change how your program compiles locally
# - Edit .codecrafters/compile.sh to change how your program compiles remotely
mvn -B --quiet package -Ddir=/tmp/codecrafters-shell-target

# Copied from .codecrafters/run.sh
#
# - Edit this to change how your program runs locally
# - Edit .codecrafters/run.sh to change how your program runs remotely
exec java -jar /tmp/codecrafters-shell-target/java_shell.jar "$@"