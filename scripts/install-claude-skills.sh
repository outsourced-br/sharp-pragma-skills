#!/usr/bin/env bash
set -euo pipefail

MODE="copy"
TARGET=".claude/skills"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --symlink) MODE="symlink" ;;
    --copy) MODE="copy" ;;
    --target) shift; TARGET="${1:-}" ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
  shift || true
done

mkdir -p "$TARGET"

for dir in sharp-*; do
  [ -d "$dir" ] || continue
  dest="$TARGET/$dir"
  rm -rf "$dest"
  if [ "$MODE" = "symlink" ]; then
    ln -s "$(pwd)/$dir" "$dest" || {
      echo "Symlink failed, falling back to copy for $dir" >&2
      cp -R "$dir" "$dest"
    }
  else
    cp -R "$dir" "$dest"
  fi
  echo "Installed $dir -> $dest"
done
