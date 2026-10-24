---
name: ai-xiaohongshu
description: 当用户给出网页链接或素材/brief，要求写成小红书笔记/文章时使用；有链接用 Jina 拉原文；无链接可先出选题。不要用于推特帖、推特长文或公众号长文。
---

# 根据链接或 brief 写小红书笔记

产出可直接发的小红书笔记。主题偏 AI/科技/工具种草时按事实写，禁止臆造。

## 默认

- 中文；开头要有钩子
- 短段落 + 少量 emoji（克制，不要刷屏）
- 口语，像博主分享，不像通稿
- 文末可带来源或「资料来自…」；标签 3–8 个相关话题

## 输入（双入口）

- **模式 A · 有链接**：用户给 URL（可加一句角度）
- **模式 B · 无链接**：用户给主题/素材/一句话 brief

缺链接且 brief 太空 → 只问一句：「给谁看、想强调什么」。有链接或 brief 够用 → 直接开干。不连环追问。

## 步骤

### 模式 A（有链接）

1. 按 [`../_shared/references/fetch-jina.md`](../_shared/references/fetch-jina.md) 用 **Jina** 拉 Markdown（本阶段只用 Jina）
2. 定角度（谁能用、解决什么烦点）
3. 按本平台形态写：钩子 → 3–5 条干货 → 一句结论/行动 → 标签；可选封面大字文案
4. 套 [`../_shared/references/voice-profile.md`](../_shared/references/voice-profile.md) + 去 AI 味（短帖档）
5. 交付

### 模式 B（无链接）

1. 根据输入出 **3–5 个选题**（标题 | 角度一句 | 为何现在发）
2. 用户未指定时默认选**最稳**的一个，并在交付里标明选了哪个、备选是什么；用户当场点名则用指定
3. 无原文时严禁编造具体新闻事实/数字；清晰标注「基于 brief 的创作，非转载」
4. 同后写 + IP + unslop（短帖档）

## 交付

1. 可复制正文（含标签）
2. 可选封面文案 1–2 套
3. 依据来源（模式 A）；模式 B 标明「基于 brief，非转载」+ 所选选题与备选
4. 推断单独标明

## 不做

- 不写成公众号中长文或多帖推特线程
- 不整页搬运
- 不臆造原文事实；Jina 失败则说明卡点，请用户粘贴正文或换链

## 去 AI 味

交稿前按 [`../_shared/references/unslop-zh.md`](../_shared/references/unslop-zh.md) **短帖档**扫一遍（humanizer-zh + 说人话）。只改表达，不增事实。  
交稿前对照 [`../_shared/references/voice-profile.md`](../_shared/references/voice-profile.md) 调语气；不与 IP 冲突的去腔优先。
