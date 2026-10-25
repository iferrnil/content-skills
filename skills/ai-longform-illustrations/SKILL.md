---
name: ai-longform-illustrations
description: 当用户要为公众号或推特长文生成带固定个人 IP 的正文配图时使用；先抽认知锚点再逐张生图。不要用于短帖封面 alone、也不替代写作 skill。也适用于：从照片/参考图创建 IP、确认角色、切换多角色、流程拆解图与核心动作图。画风由用户参考图/角色规范锁定，不提供第三方预设画风选项。
---

# 长文正文配图（固定个人 IP）

为已定稿的公众号 / 推特长文，生成带**同一固定个人 IP** 的 16:9 正文配图。封面由写作 skill 负责；本 skill 只做正文插图与角色生命周期。

工作流结构灵感来自开源 [Punk IP Illustrations](https://github.com/adrianpunk/punk-ip-illustrations)（**仅流程**：确认门、角色包、按篇幅自动定张数；**不含**其内置画风预设、角色、品牌文案或商业许可文本）。本仓库 skill 为原创表述；运行资产保存在本地 `.content-ip-assets/`。

## 画风（来自用户参考，绑定到角色）

**不要**询问或强制任何第三方预设画风（例如 loose-line-flat / retro-flat-3d、水彩 / 3D 二选一）。画风只来自用户自己的参考图与 `character-spec`。

- 首次建角或未指定角色时，**只问参考图（或种子）+ 角色名**，不问画风 A/B
- 从参考图提炼可观察的视觉语言，写入 `character.json`：
  - `style`：自由文本描述（如 `flat-cute-line`、`soft watercolor with thin ink`），说明**该用户**的样子
  - 可选 `style_id: "custom"`（标明非预设枚举）
- 同一角色后续配图一律沿用该 `style` + clean reference + `character-spec.md`；不要在一张图里混入无关视觉语言
- 已确认角色要改画风/外观 → 按「修订角色」重出设定卡 + 干净参考图，再等确认；禁止只改 manifest 字段

## 运行资产目录

优先项目根：

```text
.content-ip-assets/
├── current-character.json
├── characters/<slug>/
│   ├── character.json          # name, style (free-text), style_id?, status: draft|confirmed
│   ├── character-sheet.png
│   ├── character-reference-clean.png
│   └── character-spec.md
└── illustrations/<article-slug>/
```

无项目可写目录时回退 `~/.content-ip-assets/`。用户指定目录时从其指定。

**不要**把用户照片、草稿角色或插图提交进 Git。仓库内 `skills/_shared/ip-assets/` 仅作**种子/默认模板**（可选导入），正式真相是角色包内文件。

详见 [`references/character-lifecycle.md`](references/character-lifecycle.md)。

## 每次开始时

1. 读 [`references/character-lifecycle.md`](references/character-lifecycle.md)，解析运行目录、当前角色、`status` 与 `style`
2. 本轮未指定角色、且是入口 → 先「请上传参考图（或同意用种子）+ 角色名」；**不要**问第三方画风选项，也不要同时索要文章
3. 按阶段路由，只读当前阶段需要的参考文件

## 阶段路由

| 情况 | 进入 |
| --- | --- |
| 只调用本 skill，未指定角色 | 首次引导（参考图或种子 + 角色名） |
| 无照片/文章、无已确认角色 | 首次引导（参考图或种子 + 角色名） |
| 上传照片或已有参考图，要求创建 IP | 创建个人角色 → `draft` → **必须等明确确认** |
| 用户说「确认」「就用这个」「定稿」 | 确认角色 → `confirmed` |
| `draft` 角色要改外观 | 修订角色（新版本，仍 `draft`） |
| 提供文章/观点/链接，且有 `confirmed` 角色 | 文章配图 |
| 列出 / 切换角色 | 角色管理（仅 `confirmed` 可激活） |
| 同时给照片+文章，但无确认角色 | **先建角并停在确认**；不提前配图 |
| 无确认角色却要配图 | 先创建/确认角色（参考图 + 角色名）；禁止用 draft 生文插图 |

## 创建个人角色（→ draft）

完整读 [`references/character-lifecycle.md`](references/character-lifecycle.md)。

1. 输入为**人物照片**或**已有 IP 参考图**（唯一身份与画风源）+ 角色名称/昵称
2. 提炼可观察特征（脸型、发型、五官、肤色、年龄感、体型、固定服装、配件、气质）以及参考图本身的线稿/上色/材质等视觉语言；不推断敏感属性
3. 将画风写成自由文本 `style`（必要时加 `style_id: "custom"`），写入 manifest 与 `character-spec.md`
4. 生成**角色设定图（多视图）**：布局跟随参考图的视觉语言（常见：横向正面 / 侧面 / 背面 / 3/4 / 自然动作；若参考本身是竖版设定板则沿用竖版主全身 + 多角度）——**不要**套用第三方预设布局名
5. 再生成**干净单人物全身参考图**（纯白或透明底；无设定板标题、边框、多视图）
6. 写出 `character-spec.md`
7. 写入 `.content-ip-assets/characters/<slug>/`，`status: draft`；更新不自动激活
8. 展示设定板 + 干净参考图 + 路径 + 提炼的 `style` 文案，**只问确认还是修改**

种子导入：若用户同意用 `skills/_shared/ip-assets/` 里现有参考图作起点，可据此生成设定卡与干净参考，`style` 仍从该种子图提炼，仍进 `draft`，仍须确认。

## 确认角色

- 仅用户**明确**确认时执行（「看起来不错」不够）
- 检查 sheet / clean reference / spec 均存在
- `status` → `confirmed`；写入 `current-character.json`
- 此后文章配图以角色包 `character-spec.md` + `character-reference-clean.png` + manifest `style` 为**活真相**；`skills/_shared/ip-assets/ip-character.md` 仅为种子说明

## 文章配图（仅 confirmed）

完整读：

- [`references/illustration-modes.md`](references/illustration-modes.md)（张数表 + 流程拆解 / 核心动作）
- [`references/prompt-template.md`](references/prompt-template.md)（按角色 `style` + character-spec + clean reference 填模板）
- [`references/qa-checklist.md`](references/qa-checklist.md)
- 当前角色包 `character-spec.md`

执行：

1. 解析当前或指定角色；**拒绝 draft**
2. **读完整文章**（本地文件读全文；链接用写作侧同一套拉取；缺正文则停止，不凭标题臆测）
3. 按字数表自动定张数（用户指定优先）；每张不同认知锚点
4. 每张选模式：**流程拆解** 或 **核心动作**；**开画前输出 shot list 表**（见 illustration-modes.md：序号/slug/锚点/模式/插入位），用户未叫停则继续
5. 默认只传**干净单人物参考图**；需侧面/背面时才加设定板（并声明只提供身份角度）。**硬锚点必须写入每张提示词**（从 character-spec 抄）；正文插图遵循 spec 的服装策略（如默认无高开叉）
6. **逐张** 16:9 生成（同一 clean reference + 同一 `style` 描述）；不拼成一张大图。**默认全身**（头到脚含鞋入镜）；提示词写死 `FULL BODY head-to-toes, shoes visible`；仅用户明确要求半身/特写时才改景别
7. 每张过 QA；不合格优先重生成该张（同图最多针对性重试 2 次）
8. 保存到 `.content-ip-assets/illustrations/<article-slug>/01-<slug>.png`（已存在用 `-v2`）；报告用途、绝对路径、建议插入位置
9. 默认不改原文；用户明确要求「写入 Markdown」且文件可写时，先备份再插入图片引用

禁止：无确认角色 / 无 clean reference 文件却声称已出图；无文件却写「已生成」。

## 角色管理

- 列出：扫描 `.content-ip-assets/characters/*/character.json`
- 切换 / 激活：仅 `confirmed`；更新 `current-character.json`
- 查看当前：读 `current-character.json` → 对应 manifest

## 与写作 skill 的衔接

`ai-wechat-article` / `ai-twitter-longform` 正文定稿后，若用户要正文配图：

1. 有 `confirmed` 当前角色 → 直接进入本文「文章配图」
2. 无 → 参考图（或种子）+ 角色名 → 创建 → **等确认**，再配图（不问第三方画风选项）
3. 封面仍由写作 skill 负责，与正文配图分开

## 不做

- 不替代写作 skill
- 不只做短帖封面 alone
- 不用 draft 角色配文章
- 不嵌入或要求第三方 skill 的商业许可文本
- 不把本仓库 skill 文案与第三方内置角色资产混用
- **不**向用户提供或强制第三方预设画风二选一（含 loose-line-flat / retro-flat-3d、水彩 / 3D 等）
