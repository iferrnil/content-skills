# 用 Jina Reader 取网页正文

本仓库写作链路 **本阶段只认 Jina**。不要在步骤里实现 Trafilatura / Firecrawl / 浏览器兜底（后续可扩展，见文末）。

## URL 形态

```text
https://r.jina.ai/{原文完整url}
```

注意：

- `{原文完整url}` 保留协议，例如 `https://example.com/post` → `https://r.jina.ai/https://example.com/post`
- 若原文 URL 含特殊字符，先做必要编码，再拼到 `r.jina.ai/` 后面；不要丢掉 `https://`

## 怎么拉

用 **WebFetch** 或 **curl** 请求上面的地址，响应一般为 Markdown（或可读纯文本）。

示例（curl）：

```bash
curl -fsSL "https://r.jina.ai/https://example.com/article"
```

## 取回后保留 / 丢掉

**保留：**

- 标题
- 来源 URL（用户给的原文链接）
- 正文主体（事实、数字、产品名、限制条件）

**丢掉（若仍夹带）：**

- 明显导航、页脚、相关推荐列表噪音
- 与正文无关的站点菜单文案

## 失败时

告诉用户：**Jina 拉失败** + 具体卡点（超时、非 200、空正文、需登录等），请用户**粘贴正文**或**换链**。

**禁止臆造原文**——没有正文就不要编造事实、数字、引语。

## 可选：工作区缓存

拉到 Markdown 后，可先落到工作区再创作，避免反复请求：

```text
/workspace/content-cache/<slug>.md
```

命名建议：

- `slug`：从标题或 URL path 取短横线小写（如 `openai-o3-release`）
- 文件头可写：标题、来源 URL、抓取时间（Asia/Shanghai）
- 同 URL 已有缓存且未过期时，可直接用缓存；用户明确要求「重新拉」再请求 Jina

## 本阶段范围

- **只用 Jina Reader**（`r.jina.ai`）
- 不加第二套抽取器；步骤与 skill 正文不要写备用实现

后续可扩展：Trafilatura、Firecrawl、浏览器渲染等——仅在文档层备注，不在当前步骤落地。
