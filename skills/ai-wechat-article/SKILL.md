---
name: ai-wechat-article
description: 当用户给出网页链接或素材/brief，要求写成微信公众号文章时使用；有链接用 Jina 拉原文；无链接可先出选题。不要用于推特帖、推特长文或小红书笔记。
---

# 根据链接或 brief 写公众号文章

产出可粘贴到公众号编辑器的中文文章。主题偏 AI/科技。

## 默认

- 中文公众号中长文（约 1200–2000 字，可按要求加减）
- 信息准确、有观点但不煽情
- **纯文本可复制**：不要 Markdown `**加粗**`（公众号会显示成原始符号）
- 可用「一、二、」或空行分段
- 文末列来源链接（有原文时）

## 输入（双入口）

- **模式 A · 有链接**：用户给 URL（可加一句角度）
- **模式 B · 无链接**：用户给主题/素材/一句话 brief

缺链接且 brief 太空 → 只问一句：「给谁看、想强调什么」。有链接或 brief 够用 → 直接开干。不连环追问。

## 步骤

### 模式 A（有链接）

1. 按 [`../_shared/references/fetch-jina.md`](../_shared/references/fetch-jina.md) 用 **Jina** 拉 Markdown（本阶段只用 Jina）
2. 定角度（对谁重要、和同类差在哪）
3. 按本平台形态写：标题（+2 备选）→ 开头 3 段内说清事由 → 2–4 小节 → 收束判断 → 来源；纯文本、无 Markdown 加粗
4. 套 [`../_shared/references/voice-profile.md`](../_shared/references/voice-profile.md) + 去 AI 味（长文 A+B）
5. 交付

### 模式 B（无链接）

1. 根据输入出 **3–5 个选题**（标题 | 角度一句 | 为何现在发）
2. 用户未指定时默认选**最稳**的一个，并在交付里标明选了哪个、备选是什么；用户当场点名则用指定
3. 无原文时严禁编造具体新闻事实/数字；清晰标注「基于 brief 的创作，非转载」
4. 同后写 + IP + unslop（长文 A+B）

写完结构后做一遍**长文档**节奏检查（句长起伏、连词堆砌、小标题口号化；见 unslop-zh.md 长文档与 sepia-zh-longform.md）。少黑话，缩写首次人话解释。

正文定稿后若用户要配图 → 调用/遵循 [`ai-longform-illustrations`](../ai-longform-illustrations/)；封面图（若有）仍由写作流程自己的封面步骤负责，**正文配图与封面分开**。

## 交付

1. 正文（纯文本，无 Markdown 加粗）
2. 2–3 个备选标题
3. 依据来源（模式 A）；模式 B 标明「基于 brief，非转载」+ 所选选题与备选
4. 推断单独标明
5. （可选）需要正文配图时，接着跑 [`ai-longform-illustrations`](../ai-longform-illustrations/)（或用户说配图时自动续跑）

## 不做

- 不写成推特单帖/线程或小红书体
- 不整页搬运原文
- 不臆造原文事实；Jina 失败则说明卡点，请用户粘贴正文或换链

## 去 AI 味

交稿前先按 [`../_shared/references/unslop-zh.md`](../_shared/references/unslop-zh.md) **短帖档**洗套话，再按 **长文档**（及 [`sepia-zh-longform.md`](../_shared/references/sepia-zh-longform.md)）检查句长起伏、连词堆砌、小标题口号化。只改表达，不增事实。  
交稿前对照 [`../_shared/references/voice-profile.md`](../_shared/references/voice-profile.md) 调语气；不与 IP 冲突的去腔优先。
