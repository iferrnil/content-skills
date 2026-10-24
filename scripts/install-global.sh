#!/usr/bin/env bash
# Install all repo skills into the current user's global skill dirs for common agents.
# Usage: ./scripts/install-global.sh [--copy]
# Default: symlink. Pass --copy to copy instead (Windows / restricted FS).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MODE=symlink
[[ "${1:-}" == "--copy" ]] && MODE=copy

link_or_copy() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  rm -rf "$dest"
  if [[ "$MODE" == copy ]]; then
    cp -R "$src" "$dest"
    echo "copied $dest"
  else
    ln -sfn "$src" "$dest"
    echo "linked $dest -> $src"
  fi
}

for d in "$ROOT"/skills/*/; do
  id="$(basename "$d")"
  [[ "$id" == _template ]] && continue
  [[ -f "$d/SKILL.md" ]] || continue
  src="$(cd "$d" && pwd)"
  # Codex / Cursor / Antigravity shared convention
  link_or_copy "$src" "$HOME/.agents/skills/$id"
  # Cursor user skills
  link_or_copy "$src" "$HOME/.cursor/skills/$id"
  # Claude Code
  link_or_copy "$src" "$HOME/.claude/skills/$id"
  # Codex (also reads ~/.codex in some setups; agents path is primary for skills)
  # WorkBuddy / CodeBuddy
  link_or_copy "$src" "$HOME/.workbuddy/skills/$id"
  link_or_copy "$src" "$HOME/.codebuddy/skills/$id"
done

echo "Installed ($MODE). Restart or reload skills in each agent if needed."
