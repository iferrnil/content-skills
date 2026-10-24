# 生图提示词模板（正文配图）

每张单独生成。将 `skills/_shared/ip-assets/ip-reference.jpg`（或 `.png`）作为**唯一**角色参考图传入；提示词只写场景/动作变化，不重写整套长相。长相以参考图 + `ip-character.md` 为准。不要复刻参考图里的房间、自拍视角或姿势。

```text
Generate one standalone 16:9 horizontal Chinese article illustration. Use the supplied reference image only to preserve the recurring personal IP character's identity; do not copy its photo background, camera angle, or pose.

Visual DNA:
White or light background. Hand-drawn / light line-art Chinese article illustration: character, objects, paths, arrows, and short notes use sparse black lines with slight wobble. Small flat color accents on the character only. Quiet white space. Sparse handwritten Chinese labels (2–5). Clean, lightly absurd product-sketch feeling. No 3D render, no gradients, no cast shadows, no commercial poster, no PPT infographic, no dense UI, no top-left giant title.

Recurring character:
Match the reference image and ip-character.md identity anchors (hair, glasses, expression, outfit). Draw with the same thin hand-drawn lines as the rest of the scene. The character is a narrative worker who performs the core conceptual action—not a decorative sticker.

Theme:
{正文配图主题 / 锚点名}

Core idea:
{这张图要表达的核心意思}

Composition / action:
{IP 在哪里、亲手在做什么、主物件、输入输出如何表现}

Short handwritten Chinese labels:
{标注1} / {标注2} / {标注3} / {可选4} / {可选5}

Constraints:
One image = one cognitive anchor. Character + main apparatus about 40%–60% of canvas; keep ample blank space. Invent a fresh low-tech physical metaphor. Do not change IP identity. Do not make it childish, a polished commercial render, or a course slide.
```

## 环境不能传参考图时

仍输出上方填好的完整 prompt，并附加：

```text
参考图路径：skills/_shared/ip-assets/ip-reference.jpg（或 .png）
请用支持参考图 / referenced_image_paths 的工具生成；当前环境未传参考图。
```

禁止在无输出文件时写「已生成」。

## 局部修复（可选）

去掉错字标注：只删指定文字，白底补齐，保留角色与构图。  
角色不像参考：只修角色身份锚点，场景与标注不动。
