# 中文去 AI 味（写作 skill 共用）

英文 unslop / Humanizer **不够用**：中文 AI 味多来自公众号腔、汇报腔、标题党，不是 delve/tapestry。

原则：**删空话、不补事实**；没有依据就标 `[待核实]`，不要为了「像人」编细节或假口语。

本仓库按篇幅分两档。短帖只跑 **A**；长文先 **A** 再叠 **B**。

---

## 推荐主次

| 优先级 | 项目 | 用途 |
| --- | --- | --- |
| 默认 | humanizer-zh-cn + 说人话（shuorenhua） | 短帖与长文的第一遍 |
| 长文加 | sepia（中文校准，结构/节奏） | 叠在默认之上；不必安装整个 sepia skill |
| 不采用为中文主力 | ZeroSlop | 英文词表；仅可借鉴「评分→改写→事实门禁」流程 |

- humanizer-zh-cn：https://github.com/holygeek00/humanizer-zh-cn
- 说人话：https://github.com/MrGeDiao/shuorenhua
- sepia（含 `references/languages/zh.md`）：https://github.com/Nanako0129/sepia
- ZeroSlop（流程备注）：https://github.com/manavmishra/ZeroSlop

### 可选扩展

| 项目 | 适合 | 链接 |
| --- | --- | --- |
| stop-slop-zh | 明确「不是英文直译」；公众号/报告/伪口语 | https://github.com/wdkang123/stop-slop-zh |
| humanizer-chinese | 36 条中文本土规则 + 防「装人味」 | https://github.com/jiji262/humanizer-chinese |
| avoid-ai-writing-zh | 中文审核/改写，分 P0–P2 | https://github.com/zero-click/avoid-ai-writing-zh |
| chinese-de-ai-writing | 少数有实测数据：哪些「常识规则」其实不成立 | https://github.com/tangwenwen-md/chinese-de-ai-writing |

选型整理可参考：https://www.ai345.info/ai-guide/remove-ai-flavor-skill-guide

---

## A. 短帖档

适用：`ai-twitter-post`、`ai-xiaohongshu`。

**主力**：humanizer-zh-cn（找回「谁对谁做了什么」、砍套话）+ 说人话（保守改稿、保事实与口气）。

### 交稿检查

命中且空洞再改，不是见到词就杀。

**开场/标题**

- 随着……的不断发展 / 在当今……时代 / 在……背景下
- 一文读懂、保姆级、建议收藏、重磅、终于来了

**黑话（用动作和结果替换）**

- 赋能、抓手、闭环、生态、沉淀、对齐、底层逻辑、心智、飞轮、护城河
- 打造、布局、赛道、破圈、深度融合、全方位、多维度

**假深刻结构**

- 假「不是 A，而是 B」/「不仅是 A，更是 B」/「表面是 A，本质是 B」（空壳对比）
- 强凑「首先…其次…最后…」三点，内容其实撑不满

**过渡与收束**

- 值得注意的是、综上所述、总而言之、由此可见、不难发现
- 未来可期、让我们拭目以待、愿我们都能……（空收束）

**句尾空升华**

- ……从而进一步赋能…… / 体现了……彰显了……

### 平台注意（短帖）

- **推特短帖**：优先砍套话和假「不是而是」；别为去味硬加语气词堆砌。
- **小红书**：可保留少量自然口语；禁止统一「假口语腔」和表情刷屏装人味。

### 不做（防过度纠偏）

- 不要故意加错别字、堆口头禅装人
- 不要统一改成同一种「说人话」网红腔
- 不要把作者原有的判断强度改掉（「可能」→「一定」）
- 句长均匀、设问多少等「流传规则」未必成立；短帖以是否空洞、是否缺主体为准（见 chinese-de-ai-writing 实测）

---

## B. 长文档

适用：`ai-twitter-longform`、`ai-wechat-article`。

**流程**：先跑短帖档同一套中文套话清洗（A），再叠 sepia 思路（结构/节奏/中文校准）。清单精简版见同目录 [`sepia-zh-longform.md`](./sepia-zh-longform.md)。不必安装整个 sepia skill。

sepia 的繁中新闻标点 / 台湾用词规则默认**不**套到大陆简中自媒体；只借结构与节奏。

### 叠在 A 之上的检查

- **句长起伏**：避免三句以上差不多长的齐整短句连排；长短交错即可，不必追求某种「均长」。
- **少叠连词**：和 / 以及 / 并且 / 同时 / 此外 / 因此 / 然而 跨句堆砌时砍；中文可用并置，不必句句用连词粘。
- **砍双音节注水**：如「进行讨论 / 加以说明」→ 改回单动词（讨论、说明）。
- **小标题别口号化**：禁「破局之道：双轮驱动」类空壳；封面/标题同样禁空壳标题党。
- **语气词**：可偶尔点缀；正式公众号勿硬塞「嘛 / 喔」。
- **「不是…而是…」**：单次可留，成串才砍（sepia 中文校准）。
- **事实门禁**：改表达不增事实；无依据标 `[待核实]`（可借鉴 ZeroSlop「评分→改写→事实门禁」流程思路，**不**引入其英文词表）。

### 平台注意（长文）

- **推特长文**：小标题与封面文案禁口号化空壳。
- **公众号**：纯文本勿滥用加粗/对称小标题；汇报腔（扎实推进、形成闭环）一律换成具体动作。

### 不做

同短帖档「不做」；另：不要为了「有起伏」硬拆句子或硬塞语气词。

---

## 各写作 skill 怎么引用

| Skill | 档位 |
| --- | --- |
| `ai-twitter-post`、`ai-xiaohongshu` | 只跑 **A. 短帖档** |
| `ai-twitter-longform`、`ai-wechat-article` | **A + B**（先洗套话，再做节奏/结构检查；可对照 `sepia-zh-longform.md`） |

在对应 `SKILL.md` 交付步骤写清档位，例如：

- 短帖：交稿前按本文件 **短帖档** 扫一遍（humanizer-zh + 说人话）。只改表达，不增事实。
- 长文：交稿前先按 **短帖档** 洗套话，再按 **长文档**（及 `sepia-zh-longform.md`）检查句长起伏、连词堆砌、小标题口号化。只改表达，不增事实。
