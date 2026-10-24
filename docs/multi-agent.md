# Multi-agent compatibility

Industry agents are converging on the same **Agent Skills** shape: one folder per skill, required `SKILL.md` with `name` + `description`.

## Discovery paths (project / workspace)

| Agent | Project path | User / global path |
| --- | --- | --- |
| Cursor | `.agents/skills/`, `.cursor/skills/` (also loads `.claude/skills/`, `.codex/skills/`) | `~/.agents/skills/`, `~/.cursor/skills/` |
| Claude Code | `.claude/skills/` | `~/.claude/skills/` |
| Codex | `.agents/skills/` | `$HOME/.agents/skills/` |
| Antigravity | `.agents/skills/` (legacy: `.agent/skills`) | `~/.gemini/config/skills/` (app); CLI may use `~/.gemini/antigravity-cli/skills/` |
| WorkBuddy / CodeBuddy | `.codebuddy/skills/` | `~/.workbuddy/skills/` or `~/.codebuddy/skills/` |

This repo keeps **one canonical copy** under `skills/` and recreates the project adapter roots with `scripts/link-adapters.sh`.

## Frontmatter rules (shared)

```yaml
---
name: kebab-case-id   # must match folder name
description: What it does AND when to use it (triggers + exclusions)
---
```

Keep descriptions concrete. Vague lines like "writing helper" do not trigger reliably.

## What stays out of shared skills

- Slack channel IDs, personal Twitter handles, private repo URLs
- Credentials and env-specific absolute paths
- Agent-proprietary tool IDs unless the step says "if available"

## Grok Bot / Cursor Bot note

Grok Bot user skills live under the bot's workflow store and are managed with UpdateSkill. To reuse a skill from this repo there, copy `skills/<id>/SKILL.md` body into UpdateSkill, or keep this repo as the source of truth and sync when the recipe changes.
