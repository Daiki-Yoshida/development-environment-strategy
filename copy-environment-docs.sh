#!/bin/bash

# Get the directory where the script is stored
SOURCE_DIR="$(dirname "$(realpath "$0")")"
ARTIFACTS_DIR="$SOURCE_DIR/artifacts"
DEST_DIR="${1:-$(pwd)}"

mkdir -p "$DEST_DIR"

# Copy all exported artifacts to the destination directory
find "$ARTIFACTS_DIR" -maxdepth 1 -name "*.md" -exec cp "{}" "$DEST_DIR" \;

echo "Environment artifacts copied to $DEST_DIR"
