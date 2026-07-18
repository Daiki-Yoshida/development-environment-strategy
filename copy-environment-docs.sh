#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/artifacts"
TARGET_DIR="${1:-}"

if [[ -z "$TARGET_DIR" ]]; then
  echo "Usage: $0 <target-directory>" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

files=(
  INDEX.md
  DEVELOPMENT_ENVIRONMENT_PHILOSOPHY.md
  ENVIRONMENT_STANDARDS.md
  WORKSPACE_STRUCTURE.md
  ENVIRONMENT_WORKFLOW.md
)

for file in "${files[@]}"; do
  source="$SOURCE_DIR/$file"
  if [[ ! -f "$source" ]]; then
    echo "ERROR: missing artifact: $source" >&2
    exit 1
  fi
  cp "$source" "$TARGET_DIR/$file"
done

echo "Copied ${#files[@]} development-environment artifacts to: $TARGET_DIR"
