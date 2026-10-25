# IP 资产种子（可选模板）

本目录是 **种子 / 默认模板**，不是运行时真相源。

正式角色包与文章插图保存在项目（或用户主目录）下的：

```text
.content-ip-assets/
├── current-character.json
├── characters/<slug>/
│   ├── character.json
│   ├── character-sheet.png
│   ├── character-reference-clean.png
│   └── character-spec.md
└── illustrations/<article-slug>/
```

由 [`ai-longform-illustrations`](../../ai-longform-illustrations/) 管理：选画风 → 创建（draft）→ **用户明确确认** → 再配图。流程结构灵感来自 [Punk IP Illustrations](https://github.com/adrianpunk/punk-ip-illustrations)（仅工作流；本仓库不内嵌其角色资产或商业许可文本）。

## 本目录文件

| 文件 | 说明 |
| --- | --- |
| `ip-reference.jpg` 或 `ip-reference.png` | 可选种子参考图；首次建角时可导入 |
| `ip-character.md` | 种子身份说明；**确认后以角色包 `character-spec.md` 为准** |
| `ip-reference.PLACEHOLDER.md` | 尚无正式图时的占位说明 |

## 首次建角建议路径

1. 在 `ai-longform-illustrations` 中选择画风（默认推荐 `loose-line-flat`）。
2. 上传清晰人物照片，**或**同意用本目录参考图作身份源。
3. 生成设定卡 + 干净单人参考 + `character-spec.md` → 写入 `.content-ip-assets/characters/<slug>/`，状态 `draft`。
4. 用户明确「确认 / 定稿」后 → `confirmed`，再跑文章配图。

## 如何替换种子参考图

1. 准备清晰、正面或 3/4 侧面、特征明显的图（建议干净背景）。
2. 放到本目录，命名为 `ip-reference.jpg` 或 `ip-reference.png`。
3. 参考图只用于锁定长相；建角时不要复刻其中的房间、自拍角度或姿势。
4. 导入并确认后，日常配图只读角色包内 clean 图，不必再改本目录。

## 无参考图时

- 配图 skill **默认停止生图**，请补照片或种子图并完成确认。
- 仅当你明确说「先用纯文字描述试跑」时，才可按文案试跑，并警告一致性差；仍不得把未确认角色标为 `confirmed`。
