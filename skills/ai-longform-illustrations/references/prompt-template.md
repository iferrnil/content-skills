# 生图提示词模板（按角色规范 + 参考图）

每张单独生成。默认传入角色包内 **`character-reference-clean.png`** 作为唯一身份参考；提示词只写场景/动作变化，不重写整套长相。长相与画风以 clean 图 + 该角色 `character-spec.md` + manifest `style`（自由文本）为准。

需要侧面/背面校验时，可额外传入 `character-sheet.png`，并在提示中写明：设定板只提供身份角度，禁止复制其背景、标题、边框或多视图排版。

**不要**套用任何第三方预设画风名（如 loose-line-flat / retro-flat-3d）。`style` 是对该角色参考图视觉语言的描述；填入下方 `{style}` 与 Visual DNA 时，用 `character-spec.md` 与参考图里写明的事实，勿发明另一套语言。

---

## 正文插图（通用）

```text
Generate one standalone 16:9 horizontal Chinese article illustration. Match the visual language described by style "{style}" and the supplied clean character reference + character-spec.md. Preserve the recurring personal IP identity; do not copy any photo background, character-sheet layout, borders, or multi-view labels.

Visual DNA (from this character's reference / spec — do not invent a conflicting art style):
{style_visual_dna}
Pure white or very light page extending to all edges preferred unless the character-spec says otherwise. Sparse handwritten Chinese labels (2–5) when useful. No commercial poster, no PPT infographic, no dense UI, no top-left giant title. Do not switch to an unrelated preset look.

Recurring character:
Match the clean reference and character-spec.md identity anchors. ALWAYS restate the hard anchors from character-spec in the prompt (e.g. glasses, hairstyle, fixed outfit pieces)—never omit them. Draw with the same line/color/material language as the scene and the locked style. The character is a narrative worker who performs the core conceptual action—not a decorative sticker.
Hard anchors (fill from character-spec; omit none that are listed):
{hard_anchors}

Theme:
{正文配图主题 / 锚点名}

Mode:
{流程拆解 / 核心动作}

Core idea:
{这张图要表达的核心意思}

Composition / action:
{IP 在哪里、亲手在做什么、主物件、输入输出如何表现；流程模式写清 3–5 节点}

Short handwritten Chinese labels:
{标注1} / {标注2} / {标注3} / {可选4} / {可选5}

Constraints:
One image = one cognitive anchor. Default FULL BODY (head-to-toes, shoes visible). Subject about 55%–70% of frame height with margin above head and below feet; do not crop at waist/thighs unless the brief explicitly asks for bust/close-up. Invent a fresh low-tech physical metaphor. Do not change IP identity. Restate hard anchors every shot. Follow costume policy in character-spec (e.g. modest/no skirt slit for article shots). Stay faithful to style "{style}" from the character pack.
```

占位说明：

- `{style}` ← `character.json` 的 `style` 自由文本（如 `flat-cute-line`）
- `{style_visual_dna}` ← 从 `character-spec.md`「画风」与可复用身份提示词整理的 2–5 句视觉事实（线稿粗细、上色方式、材质、调色习惯等），不是第三方预设文案
- `{hard_anchors}` ← 从 `character-spec.md`「身份锚点 / Identity」逐条抄入英文短句（眼镜、发型、服装等不可丢项）

---

## 服装与敏感细节（正文插图）

- 每张提示词必须显式写出 character-spec 的**硬锚点**（眼镜、发型、固定服装等），不能只说 “same as reference”
- 若 spec 写明「正文默认减弱开叉 / 无开叉」：正文插图用 modest or no skirt slit，即使种子图有高开叉
- 不要为了「好看」擅自加胸前 logo、换眼镜款式、去掉眼镜

## 景别默认（正文插图）

- **默认全身**：头到脚（含鞋）完整入镜；头顶与脚底留白；禁止默认半身/胸像/大腿裁切
- 16:9 时角色约占画幅高度 **70%–85%**，左右可留白给道具与标注，用「拉远镜头」而不是裁脚
- 仅当用户或锚点明确要求特写/半身时才改变景别，并在提示词写明
- 提示词应含硬约束：`FULL BODY head-to-toes, shoes visible, do not crop at waist or thighs`

## 创建角色时（设定卡 / 干净参考）

### 设定卡要点

- 身份与画风唯一来源：用户照片或已有参考图（或用户同意的种子图）
- 多视图布局跟随参考图语言（常见横向：正面、侧面、背面、3/4、自然动作；或竖版主全身 + 多角度）——由参考决定，不由预设枚举决定
- 线稿、上色、材质、比例夸张程度与参考图一致
- 勿复制原照片背景、水印、路人；勿臆造敏感属性
- 提炼并写入自由文本 `style`（可选 `style_id: "custom"`）

### 干净参考图要点

- 单人物、自然站姿、正面或微侧
- 纯白或透明底；无标题、边框、多视图、配色板
- 外观与设定卡完全一致，画风与参考一致
- 作为后续文章配图的**默认**身份参考

### 创建设定卡时可用的提示骨架

```text
Create a character model sheet from the supplied photo or IP reference. Lock identity and art style to that reference only—do not apply any third-party preset style names.

Output: multi-view sheet on a plain white background that matches the reference's line/color language.
Views: front, side, back, three-quarter, one natural pose (or a vertical sheet with main full-body + front/left/back/right if that better matches the reference).
No photo background, watermarks, bystanders, sheet titles, or decorative borders that are not in the reference language.
```

干净参考：

```text
From the same identity and style as the model sheet / user reference, generate one clean full-body standing character on pure white or transparent background. Front or slight three-quarter. No titles, borders, multi-views, or color swatches. Match the locked style "{style}".
```

---

## 环境不能传参考图时

仍输出填好的完整 prompt，并附加：

```text
参考图路径：.content-ip-assets/characters/<slug>/character-reference-clean.png
请用支持参考图 / referenced_image_paths 的工具生成；当前环境未传参考图。
```

禁止在无输出文件时写「已生成」。无 `confirmed` 角色时停止配图流程。
