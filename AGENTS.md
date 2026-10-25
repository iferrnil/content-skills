# AGENTS.md

This repository is a **multi-agent skill library**, not an application.

## Source of truth

- Author and edit skills only under `skills/<skill-id>/`.
- Each skill is a folder with required `SKILL.md` (YAML frontmatter `name` + `description`, then Markdown body).
- Optional siblings: `scripts/`, `references/`, `assets/`.
- Shared writing refs live in `skills/_shared/references/` (Jina fetch, voice-profile, unslop).
- Shared IP **seed** assets live in `skills/_shared/ip-assets/`. Runtime character packs and illustrations live in project-local `.content-ip-assets/` (gitignored). Workflow structure inspired by Punk IP Illustrations; do not vend their built-in character or commercial license text here.
- Do **not** put personal accounts, API keys, or one-off paths in shared recipes.

## Writing pipeline (v1)

Four content skills share a dual-entry flow: **with URL → Jina-only fetch** (`fetch-jina.md`); **without URL → 3–5 topic options then write**. Apply `voice-profile.md` before unslop. Do not add a second extractor in this phase. Longform optional body illustrations: after draft, run `ai-longform-illustrations` (requires a `confirmed` character in `.content-ip-assets/`; otherwise create → draft → explicit confirm first). Cover stays with the writing skill.

## Adapter roots (do not fork content)

These directories only **link** to `skills/` so different agents discover the same files:

| Path | Used by |
| --- | --- |
| `.agents/skills/` | Codex, Cursor, Google Antigravity |
| `.claude/skills/` | Claude Code |
| `.cursor/skills/` | Cursor (also loads `.agents` / `.claude`) |
| `.codebuddy/skills/` | WorkBuddy / CodeBuddy (project scope) |

After adding a skill folder, run:

```bash
./scripts/link-adapters.sh
```

## Adding a skill

1. Copy `skills/_template/` → `skills/<kebab-id>/`.
2. Set `name` (must match folder) and a trigger-heavy `description`.
3. Write steps that any agent can follow (no Cursor-only or Claude-only tool names unless gated).
4. Run `./scripts/link-adapters.sh`.
5. Open a PR with one skill per PR when possible.

## Global install (any machine)

```bash
./scripts/install-global.sh          # symlinks into ~/.agents, ~/.claude, ~/.cursor, ~/.workbuddy, ~/.codebuddy
./scripts/install-global.sh --copy   # if symlinks are unavailable
```

See `docs/multi-agent.md` for per-agent notes.
