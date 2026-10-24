#!/usr/bin/env bash
# Recreate relative symlinks from adapter roots → skills/<id>
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

skills=()
for d in skills/*/; do
  id="$(basename "$d")"
  [[ "$id" == _template ]] && continue
  [[ -f "skills/$id/SKILL.md" ]] || continue
  skills+=("$id")
done

if [[ ${#skills[@]} -eq 0 ]]; then
  echo "No skills found under skills/"
  exit 1
fi

for dest in .agents/skills .claude/skills .cursor/skills .codebuddy/skills; do
  mkdir -p "$dest"
  for id in "${skills[@]}"; do
    ln -sfn "../../skills/$id" "$dest/$id"
    echo "linked $dest/$id -> skills/$id"
  done
done

echo "Done. ${#skills[@]} skill(s) linked into adapter roots."
