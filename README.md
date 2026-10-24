# content-skills

Multi-agent **content skills** library. One recipe per skill, shared across Codex, Claude Code, Cursor, Antigravity, and WorkBuddy / CodeBuddy.

## Layout

```text
skills/                 # canonical skills (edit here)
  ai-twitter-post/
  ai-twitter-longform/  # X long-form + cover image
  ai-xiaohongshu/
  ai-wechat-article/
  ai-longform-illustrations/  # 长文正文配图（固定 IP）
  _shared/references/   # Jina 拉取、voice-profile、去 AI 味
  _shared/ip-assets/    # IP 参考图 + 身份锚点
  _template/
.agents/skills/         # adapters → skills/*
.claude/skills/
.cursor/skills/
.codebuddy/skills/
scripts/
  link-adapters.sh
  install-global.sh
docs/multi-agent.md
AGENTS.md
```

## Skills

| Id | Platform | When to use |
| --- | --- | --- |
| [ai-twitter-post](./skills/ai-twitter-post/) | X 短帖 | 链接或 brief → 一条口语推特（默认单帖） |
| [ai-twitter-longform](./skills/ai-twitter-longform/) | X 长文 | 链接或 brief → 推特长文，**必须带封面图/封面 brief** |
| [ai-xiaohongshu](./skills/ai-xiaohongshu/) | 小红书 | 链接或 brief → 小红书笔记 |
| [ai-wechat-article](./skills/ai-wechat-article/) | 公众号 | 链接或 brief → 公众号中长文 |
| [ai-longform-illustrations](./skills/ai-longform-illustrations/) | 配图 | 长文正文配图（固定个人 IP；先锚点再逐张生图） |

## Quick start

```bash
./scripts/link-adapters.sh
./scripts/install-global.sh          # or --copy
```

## Add a skill

```bash
cp -R skills/_template skills/my-new-skill
# edit SKILL.md (name must match folder)
./scripts/link-adapters.sh
```

Keep recipes generic. Personal accounts and secrets belong in agent config, not here.

## 写作链路

四个写作 skill 共用同一套双入口：

| 入口 | 行为 |
| --- | --- |
| **模式 A · 有链接** | 用 **Jina Reader** 拉 Markdown → 定角度 → 按平台形态写 → 套 IP → 去 AI 味 |
| **模式 B · 无链接** | 先出 3–5 选题（标题 \| 角度 \| 为何现在发）→ 默认选最稳并标明备选 → 创作（标注「基于 brief，非转载」） |

- **Jina-only**：本阶段只用 [`fetch-jina.md`](./skills/_shared/references/fetch-jina.md)（`https://r.jina.ai/{原文完整url}`）；失败则请用户粘贴正文或换链，禁止臆造。后续可扩展其他抽取器，步骤里不实现。
- **个人 IP**：交稿前对照 [`voice-profile.md`](./skills/_shared/references/voice-profile.md)；可复制模板见 [`voice-profile.template.md`](./skills/_shared/references/voice-profile.template.md)。平台 skill 只写形态，语气以 IP 为准。
- **长文可选配图**：`ai-wechat-article` / `ai-twitter-longform` 正文定稿后，可续跑 [`ai-longform-illustrations`](./skills/ai-longform-illustrations/)（固定 IP 参考图 + 认知锚点 + 逐张生成）；与封面步骤分开。IP 资产见 [`_shared/ip-assets/`](./skills/_shared/ip-assets/)。

## 中文去 AI 味

共用清单分两档，见 [skills/_shared/references/unslop-zh.md](./skills/_shared/references/unslop-zh.md)：

- **短帖**（`ai-twitter-post`、`ai-xiaohongshu`）：humanizer-zh-cn + 说人话，只跑短帖档。
- **长文**（`ai-twitter-longform`、`ai-wechat-article`）：先短帖档洗套话，再叠 sepia 结构/节奏（精简清单 [sepia-zh-longform.md](./skills/_shared/references/sepia-zh-longform.md)）。

交稿前对照 `voice-profile.md` 调语气；不与 IP 冲突的去腔优先。

ZeroSlop 不当中文主力；英文 pstack `unslop` 仅作补充。
