#!/usr/bin/env bash
# Build the zip ChatGPT takes: the Agent Plugins manifest, the MCP config and
# the two images the manifest names. Skills stay out, as in the first upload.
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"
dir=plugins/investorbase
version="$(grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' "$dir/plugin.json" | head -1 | sed -e 's/.*:[[:space:]]*"//' -e 's/"$//')"
out="$PWD/dist/investorbase-$version.zip"

mkdir -p dist
rm -f "$out"
(cd "$dir" && zip -X -q "$out" mcp.json plugin.json assets/icon.png assets/logo.png)
echo "$out"
