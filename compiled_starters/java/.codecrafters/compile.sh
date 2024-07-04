#!/bin/sh
#
# This script is used to compile your program on CodeCrafters
# 
# This runs before .codecrafters/run.sh
#
# Learn more: <insert-link>

mvn -B --quiet package -Ddir=/tmp/codecrafters-shell-target
