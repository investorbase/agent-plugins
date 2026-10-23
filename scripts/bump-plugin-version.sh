#!/usr/bin/env bash
# Bump the patch version of each plugin a commit touches, in both manifests.
# A customer's update only reinstalls when the version changes, so every
# commit that ships something gets the next patch. A bump already staged by
# hand wins, so a minor or major written on purpose is never overridden.
set -uo pipefail

repo="$(git rev-parse --show-toplevel 2>/dev/null)" || exit 0
gitdir="$(git rev-parse --git-dir 2>/dev/null)" || exit 0
case "$gitdir" in /*) ;; *) gitdir="$repo/$gitdir" ;; esac

# A rebase, merge or cherry-pick replays history. It releases nothing.
for marker in rebase-merge rebase-apply MERGE_HEAD CHERRY_PICK_HEAD REVERT_HEAD; do
  [ -e "$gitdir/$marker" ] && exit 0
done
git rev-parse --verify HEAD >/dev/null 2>&1 || exit 0

touched="$(git diff --cached --name-only | sed -nE 's#^(plugins/[^/]+)/.*#\1#p' | sort -u)"
[ -n "$touched" ] || exit 0

version_of() {
  grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed -e 's/.*:[[:space:]]*"//' -e 's/"$//'
}

set_version() {
  local file="$1" next="$2" tmp="$1.bump.$$"
  sed "s/\"version\"[[:space:]]*:[[:space:]]*\"[^\"]*\"/\"version\": \"${next}\"/" "$file" > "$tmp" || { rm -f "$tmp"; return 1; }
  grep -q "\"version\": \"${next}\"" "$tmp" || { rm -f "$tmp"; return 1; }
  mv "$tmp" "$file" && git add "$file"
}

for dir in $touched; do
  plugin="${dir#plugins/}"
  rel="$dir/.claude-plugin/plugin.json"
  [ -f "$repo/$rel" ] || continue
  current="$(version_of < "$repo/$rel")"
  committed="$(git show "HEAD:$rel" 2>/dev/null | version_of)"
  [ -n "$current" ] && [ -n "$committed" ] && [ "$current" = "$committed" ] || continue

  IFS=. read -r major minor patch <<EOT
$current
EOT
  case "${major}${minor}${patch}" in ''|*[!0-9]*) continue ;; esac
  next="${major}.${minor}.$((patch + 1))"

  set_version "$repo/$rel" "$next" || continue
  set_version "$repo/$dir/.codex-plugin/plugin.json" "$next" || continue
  echo "bump-plugin-version: ${plugin} ${current} -> ${next}"
done
exit 0
