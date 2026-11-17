#!/usr/bin/env bash
# Build the zip submitted to OpenAI: the whole plugin folder, minus what git ignores.
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"
dir=plugins/investorbase
version="$(grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' "$dir/plugin.json" | head -1 | sed -e 's/.*:[[:space:]]*"//' -e 's/"$//')"
out="$PWD/dist/investorbase-$version.zip"

mkdir -p dist
rm -f "$out"
(cd "$dir" && git ls-files --cached --others --exclude-standard | zip -X -q "$out" -@)
echo "$out"
