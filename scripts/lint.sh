#!/usr/bin/env bash
# The one check, run by the pre-commit hook and by CI. CI also sets LINT_BASE
# to the target branch, so a changed plugin must carry a version above it.
set -uo pipefail

cd "$(git rev-parse --show-toplevel)"
claude_bin="${CLAUDE_BIN:-claude}"
fail=0
err() { echo "lint: $*" >&2; fail=1; }

version_of() {
  grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' "$1" | head -1 | sed -e 's/.*:[[:space:]]*"//' -e 's/"$//'
}

$claude_bin plugin validate . --strict || fail=1
for dir in plugins/*/; do
  $claude_bin plugin validate "$dir" --strict --profile directory || fail=1
done

for dir in plugins/*/; do
  name="$(basename "$dir")"
  claude_manifest="$dir.claude-plugin/plugin.json"
  codex_manifest="$dir.codex-plugin/plugin.json"
  [ -f "$codex_manifest" ] || { err "$name: missing .codex-plugin/plugin.json"; continue; }
  a="$(version_of "$claude_manifest")"
  b="$(version_of "$codex_manifest")"
  [ "$a" = "$b" ] || err "$name: versions differ, claude $a, codex $b"
  grep -q "\"name\": \"$name\"" "$claude_manifest" || err "$name: .claude-plugin/plugin.json name is not $name"
  grep -q "\"name\": \"$name\"" "$codex_manifest" || err "$name: .codex-plugin/plugin.json name is not $name"
  [ -f "$dir/LICENSE" ] || err "$name: missing LICENSE"
  [ -f "$dir/README.md" ] || err "$name: missing README.md"
done

for skill in plugins/*/skills/*/; do
  md="$skill/SKILL.md"
  yaml="$skill/agents/openai.yaml"
  [ -f "$yaml" ] || { err "$skill: missing agents/openai.yaml"; continue; }
  user_md=0; user_yaml=0
  grep -q '^disable-model-invocation: true' "$md" && user_md=1
  grep -q 'allow_implicit_invocation: false' "$yaml" && user_yaml=1
  [ "$user_md" = "$user_yaml" ] || err "$skill: SKILL.md and openai.yaml disagree on invocation"
done

dashes="$(grep -rnI --exclude-dir=.git --exclude=lint.sh -e $'\xe2\x80\x94' -e $'\xe2\x80\x93' . || true)"
[ -z "$dashes" ] || { echo "$dashes" >&2; err "em dash or en dash found"; }

if [ -n "${LINT_BASE:-}" ]; then
  for dir in $(git diff --name-only "$LINT_BASE"...HEAD | sed -nE 's#^(plugins/[^/]+)/.*#\1#p' | sort -u); do
    rel="$dir/.claude-plugin/plugin.json"
    [ -f "$rel" ] || continue
    head="$(version_of "$rel")"
    base="$(git show "$LINT_BASE:$rel" 2>/dev/null | grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed -e 's/.*:[[:space:]]*"//' -e 's/"$//')"
    [ -n "$base" ] || continue
    top="$(printf '%s\n%s\n' "$base" "$head" | sort -V | tail -1)"
    if [ "$base" = "$head" ] || [ "$top" != "$head" ]; then
      err "$dir: version $head is not above $base on $LINT_BASE"
    fi
  done
fi

[ "$fail" = 0 ] && echo "lint: ok"
exit "$fail"
