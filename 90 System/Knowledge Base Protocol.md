---
type: protocol
status: evergreen
created: 2026-08-10
updated: 2026-08-10
aliases:
  - 知识库协议
tags:
  - knowledge-base
  - governance
---

# Knowledge Base Protocol

## 目标

让知识在人工触发的 AI 协作中持续积累，同时保持来源可追溯、变更可审计、内容可回滚。这里的“自生长”表示每次处理材料时自动完成提炼、连接和索引，不表示插件在后台未经请求地修改笔记。

## 信息生命周期

1. **Capture**：原始材料进入 `00 Inbox/`，保留原文、出处和上下文。
2. **Source**：外部材料进入 `10 Sources/`，记录作者、URL、发布日期与访问日期。
3. **Distill**：稳定、可复用的单一观点进入 `20 Knowledge/`。
4. **Connect**：添加有解释力的 wikilink，并更新 `30 Maps/` 中的相关地图。
5. **Apply**：项目相关决策与交付物在 `40 Projects/` 中引用知识，而不是复制知识。
6. **Review**：定期检查孤立、重复、冲突、缺少来源和长期未更新的笔记。
7. **Archive**：只有在用户确认后，才把不活跃内容移动到 `99 Archive/`。

## 元数据规范

新建知识笔记使用以下最小属性：

```yaml
---
type: concept
status: seed
created: YYYY-MM-DD
updated: YYYY-MM-DD
aliases: []
tags: []
sources: []
confidence: low
---
```

- `type`：`inbox`、`source`、`concept`、`moc`、`project`、`decision`、`protocol`。
- `status`：`seed`、`growing`、`evergreen`、`archived`。
- `sources`：使用 URL 或来源笔记的 wikilink；没有来源时保持空数组。
- `confidence`：`low`、`medium`、`high`。高置信度必须有明确证据。
- `created` 只在创建时写入；内容发生实质变化时更新 `updated`。

已有笔记的元数据不要求一次性迁移；仅在正常编辑该笔记时逐步规范化。

## 原子笔记标准

- 一个稳定标题表达一个概念、结论、模式或决策。
- 开头直接给出可独立理解的核心结论。
- 区分事实、推断、经验和待验证假设。
- 引用来源支持外部事实；不要把 AI 生成内容当作来源。
- 在“关联”部分解释链接关系，而不是堆积无语义链接。
- 存在相反观点时增加“冲突与边界”，不覆盖或删除旧观点。

## 安全边界

- 默认允许创建新笔记和小范围增补。
- 删除、移动、重命名、合并或批量改写需要用户明确批准。
- 发现重复时，在 `00 Inbox/` 创建合并建议，列出候选文件和差异。
- 无法验证的内容标记为待核实，并保持低置信度。
- 不把 API Key、Token、Cookie、私钥、密码或环境变量值写入 Vault。

## 每次园艺完成标准

- 新笔记可从 [[Home]]、一个知识地图或一个项目入口到达。
- 新外部事实具有来源，或明确标为待验证。
- wikilink 指向存在的文件或明确的待建主题。
- 汇报新增、修改、未解决问题和需要用户批准的建议。

