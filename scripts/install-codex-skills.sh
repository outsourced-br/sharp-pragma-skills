#!/usr/bin/env bash
set -euo pipefail

MODE="copy"
TARGET="${CODEX_HOME:-$HOME/.codex}/skills"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --symlink) MODE="symlink" ;;
    --copy) MODE="copy" ;;
    --target) shift; TARGET="${1:-}" ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
  shift || true
done

if [ -z "$TARGET" ]; then
  echo "Target must not be empty." >&2
  exit 2
fi

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

mkdir -p "$TARGET"

for dir in "$REPO_ROOT"/sharp-*; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  dest="$TARGET/$name"
  rm -rf "$dest"

  if [ "$MODE" = "symlink" ]; then
    ln -s "$dir" "$dest" || {
      echo "Symlink failed, falling back to copy for $name" >&2
      cp -R "$dir" "$dest"
    }
  else
    cp -R "$dir" "$dest"
  fi

  echo "Installed $name -> $dest"
done
