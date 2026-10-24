---
name: ai-longform-illustrations
description: 当用户要为公众号或推特长文生成带固定个人 IP 的正文配图时使用；先抽认知锚点再逐张生图。不要用于短帖封面 alone、也不替代写作 skill。
---

# 长文正文配图（固定个人 IP）

为已定稿或已有大纲的公众号 / 推特长文，生成带**同一固定个人 IP** 的 16:9 正文配图。封面图仍由写作 skill（如 `ai-twitter-longform`）负责；本 skill 只做正文插图。

参考思路：固定 IP 参考图 + 认知锚点 + 逐张生成 + QA（见开源 personal-ip-illustrations）。

## 何时用

- 用户说「配图」「正文插图」「个人 IP 配图」「shot list」
- `ai-wechat-article` / `ai-twitter-longform` 正文定稿后，用户要配图或交付清单触发续跑

## 不做

- 不替代写作 skill（不写正文）
- 不只做短帖封面 alone（封面走 longform 自己的封面步骤）
- 不臆造「已生成」却无文件

## 默认画风（可被 `ip-character.md` 覆盖）

- 16:9、白底或浅底
- 手绘 / 轻线稿感；角色少量上色
- 少字标注（每张 2–5 处中文）
- 每张只讲一个认知锚点
- 不像 PPT / 海报 / 商业 KV

## 步骤

### 1. 确认正文或大纲

已有正文或大纲即可（可来自刚写完的 `ai-wechat-article` / `ai-twitter-longform`）。没有则请用户粘贴，或先跑对应写作 skill。

### 2. 读 IP 资产

路径相对本仓库 `skills/`：

| 文件 | 用途 |
| --- | --- |
| [`../_shared/ip-assets/ip-reference.jpg`](../_shared/ip-assets/ip-reference.jpg)（或 `.png`） | **唯一**角色参考图 |
| [`../_shared/ip-assets/ip-character.md`](../_shared/ip-assets/ip-character.md) | 身份锚点 / 可变项 / 禁止项 / 画风 |

**无参考图时的停止行为：**

1. 若目录里只有 [`ip-reference.PLACEHOLDER.md`](../_shared/ip-assets/ip-reference.PLACEHOLDER.md)、没有 `ip-reference.jpg` / `ip-reference.png` → **停止生图**，请用户把正式参考图放入并命名为上述文件名；或说明可用占位文字描述（见下）。
2. 仅当用户**明确说**「先用纯文字描述试跑」时，才可无参考图试跑；必须在交付中**警告：无参考图一致性差，正式发布前应补图重跑**。
3. 禁止在未生成文件的情况下声称「已出图」。

### 3. 提取认知锚点 → shot list

从正文抽出 **4–8 个**认知锚点（卡点 / 分流 / 对比 / 流程 / 取舍等）；短内容 **1–3 个**。每张只讲一个锚点。

输出 shot list（表格或列表），每行：

| 锚点名 | 对应段落 | 隐喻动作 | 画面一句 |
| --- | --- | --- | --- |
| … | 小节标题或段落后 | IP 亲自做的解释动作 | 构图/物件一句话 |

优先让主角亲手完成动作；若去掉主角隐喻仍成立，则重构，让他成为推动 / 搬运 / 判断 / 连接的一部分。

可选：按 [`references/prompt-template.md`](references/prompt-template.md) 为每张填好提示词变量。

### 4. 逐张生成（默认 16:9）

- **一张一张生成**，不要拼成一张大图。
- 每张必须带上**同一张**参考图（宿主若支持 `GenerateImage` / `referenced_image_paths` 等则传入）。
- 提示词只写**场景 / 动作 / 物件变化**；不重写整套长相（长相以参考图 + `ip-character.md` 为准）。
- 若当前环境**不能传参考图**：仍输出完整 prompt，并说明「请用支持参考图的工具生成」，写清参考图路径；不要假装已生成。
- 建议保存路径：

```text
/workspace/content-cache/illustrations/<article-slug>/01-<anchor-slug>.png
02-<anchor-slug>.png
…
```

不覆盖已有文件，除非用户明确要求。

### 5. QA（每张过一遍）

1. **一眼是否同一 IP**（发型、眼镜、气质与参考图一致）
2. **主角是否在做解释观点的动作**（不是角落卖萌贴纸）
3. **是否像 PPT / 海报** → 不合格，重生成或简化
4. **中文标注若有错字** → 减少文字，或标「待修」后改

不合格优先重生成该张，不要硬修成另一人物。

### 6. 交付

1. **shot list**（锚点名 | 对应段落 | 隐喻动作 | 画面一句）
2. **各图文件路径**（或「待用参考图工具生成」+ 完整 prompt + 参考图路径）
3. **建议插入正文的位置**（通常：对应小节标题后）
4. 若无参考图试跑：醒目警告一致性风险

## 与封面的边界

| | 封面 | 正文配图（本 skill） |
| --- | --- | --- |
| 负责方 | `ai-twitter-longform` 等写作 skill | `ai-longform-illustrations` |
| 目的 | 头图 / 吸引点击 | 解释观点、锚住一节 |
| IP | 可选 | **固定同一 IP 参考图** |

## 约束

- 不擅自改 IP 性别、年龄感、发色、眼镜等身份锚点
- 不把全文塞进图里；不做复杂架构图、真实 UI 截图、可编辑 SVG
- 个人正式设定与参考图由用户放入 `_shared/ip-assets/`，不把私密账号写进本 recipe
