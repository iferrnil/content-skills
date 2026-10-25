# 角色生命周期（创建 → draft → confirm → 使用）

## 运行目录

优先：

```text
<project-root>/.content-ip-assets/
```

不可写或需跨项目时回退 `~/.content-ip-assets/`。用户指定目录时从其指定。

不要把 Skill 安装目录当运行目录；不要把用户照片或生成角色推进 Git。

## 目录结构

```text
.content-ip-assets/
├── current-character.json
├── characters/
│   └── <character-slug>/
│       ├── character.json
│       ├── character-sheet.png
│       ├── character-reference-clean.png
│       ├── character-spec.md
│       └── *-v2.png          # 修订版本，不覆盖旧文件
└── illustrations/
    └── <article-slug>/
        ├── 01-topic.png
        └── 02-topic.png
```

`character-slug`：英文小写 kebab-case（字母、数字、连字符）。中文名放在 manifest 的 `name`。

## 状态机

| 状态 | 含义 | 可否配文章 | 可否设为当前 |
| --- | --- | --- | --- |
| `draft` | 已生成或修订，等待明确确认 | 否 | 否 |
| `confirmed` | 用户明确确认 | 是 | 是 |

- 「看起来不错」≠ 确认；须「确认」「定稿」「就用这个」等明确语句
- 每次修订增加 `revision`，保留旧图，manifest 指向最新版本

## Manifest

`character.json` 最少字段：

```json
{
  "schema_version": 1,
  "slug": "creator-ip",
  "name": "创作者",
  "style": "flat-cute-line",
  "style_id": "custom",
  "status": "draft",
  "revision": 1,
  "created_at": "2026-10-24T00:00:00+08:00",
  "updated_at": "2026-10-24T00:00:00+08:00",
  "confirmed_at": null,
  "assets": {
    "sheet": "character-sheet.png",
    "clean_reference": "character-reference-clean.png",
    "spec": "character-spec.md"
  }
}
```

### `style` 字段

- **自由文本**，描述从用户参考图提炼出的视觉语言（例：`flat-cute-line`、`soft watercolor with thin ink outline`）
- 可选 `style_id: "custom"`，标明不是第三方预设枚举
- **禁止**把 `style` 限死为 `loose-line-flat` / `retro-flat-3d` 或任何固定二选一；也不要向用户展示这类选项
- 同一角色配图全程沿用该描述；换外观/画风须走修订流程重出资产

`current-character.json` 只存当前已确认角色的 `slug` 与相对路径，不复制整份人物规范。

## 从种子导入（可选）

仓库 `skills/_shared/ip-assets/` 可作首次种子：

1. 用其中的 `ip-reference.jpg` / `.png`（或用户另给的照片）作身份与画风源
2. 从该图提炼 `style`，生成 sheet + clean reference + `character-spec.md`
3. 注册为 `draft`，**仍须用户确认** 后才可配图
4. 确认后，活真相是角色包内 `character-spec.md` + clean 图 + manifest `style`；种子目录里的 `ip-character.md` 仅作历史/模板说明

## 创建步骤摘要

1. 参考图（或种子）+ 角色名齐全；**不问**第三方画风 A/B
2. 内部提取固定身份与画风（只写视觉事实）→ 写入自由文本 `style`（可选 `style_id: "custom"`）
3. 生成多视图设定卡 → 再生成干净单人参考图（布局与线色跟随参考，不套预设名）
4. 写 `character-spec.md`（结构见下）
5. 写入角色包，`status: draft`；展示并等待确认或修改
6. 明确确认后：`status: confirmed`，更新 `current-character.json`

### character-spec.md 结构

```markdown
# <角色名>角色规范

## 正式视觉资产
- 默认身份参考：character-reference-clean.png
- 多角度参考：character-sheet.png
- 画风：{从参考图提炼的自由文本，与 character.json 的 style 一致}
- style_id：custom（若使用）

## 固定身份特征
- 脸型与五官比例：…
- 发型与发际线：…
- 肤色、年龄感与身体比例：…
- 整体气质：…

## 固定服装与配件
- 上装 / 下装 / 鞋 / 配件：…

## 画风细节（来自参考）
- 线稿 / 描边：…
- 上色与材质：…
- 比例夸张与常用构图习惯：…

## 允许变化
- 动作、姿态、朝向、视线、轻微表情

## 禁止漂移
- 不得改变的具体项目（含不得换成无关预设画风）

## 可复用身份提示词
> 一段只描述固定身份 + 锁定画风的紧凑提示词
```

## 修订

1. 读当前 draft 的 sheet / clean / spec / style
2. 用户修改转成一个明确视觉变更；未提及特征保持不变
3. 同时传入待改图、原照片（若可访问）、当前 clean 图；每次只修一个主问题
4. 存为新版本（`-v2`…），重新注册为 `draft`，再等确认
5. 换画风或大幅改外观：按新参考/新描述重出设定卡与干净参考，更新 `style` 文案，再确认；禁止只改 JSON

## 多角色

- 列出全部 `characters/*/character.json`
- `activate` 仅允许 `confirmed`
- 切换角色时使用该角色绑定的 `style`（各角色可有不同自由文本画风）

## 路径降级

图像工具无法写入目标目录时：

1. 保留工具返回的实际绝对路径并如实报告
2. 不伪造「已写入角色包」
3. 资产不齐则不得标为 `confirmed`
