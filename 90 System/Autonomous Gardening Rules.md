---
type: protocol
status: evergreen
created: 2026-08-11
updated: 2026-08-11
aliases:
  - 自主整理规则
  - 自动园艺规则
tags:
  - knowledge-base
  - automation
  - governance
---

# Autonomous Gardening Rules

## 用户只需要说什么

- `整理一下`：处理全部未整理 Inbox 材料，完成低风险增量修改、检查、Git 提交和推送。
- `整理一下，不提交`：完成整理和检查，但不提交或推送。
- `只检查一下`：只读检查孤立、重复、冲突、缺少来源和过期内容，不修改文件。
- `整理一下 <路径或笔记名>`：只处理指定材料及其必要的来源、知识和地图关联。

Claudian/Codex 必须自动调用 `$knowledge-gardener`，不得要求用户重复输入技能名称或逐项确认低风险步骤。

## 默认整理范围

1. 读取 `Home.md`、本协议、知识库协议和相关地图。
2. 确认 Git 工作区干净；存在无关的预先修改时停止，避免混入本次提交。
3. 处理 `00 Inbox/` 中 `processing_status: unprocessed` 的材料，以及用户明确指定的材料。
4. 搜索标题、别名和关键词，避免创建重复知识。
5. 外部材料先创建或关联 `10 Sources/` 来源笔记，保留作者、URL、发布日期和访问日期。
6. 只把稳定、可复用且证据充分的单一结论写入 `20 Knowledge/`。
7. 为新知识添加可解释的 wikilink，并更新至少一个 `30 Maps/` 地图或 `40 Projects/` 项目入口。
8. 保留 Inbox 原文。处理成功后设置 `processing_status: processed`、`processed: YYYY-MM-DD` 和 `outputs`；证据不足时设置为 `blocked` 并说明缺口。

## 无需再次询问的动作

- 创建来源笔记、原子知识笔记和必要的地图条目。
- 小范围补充 frontmatter、来源、关联和更新时间。
- 修复本次新增内容造成的格式或链接问题。
- 在全部检查通过后，精确暂存本次文件、创建 `knowledge:` 提交并推送到 `origin/main`。

## 必须停止并询问用户的动作

- 删除、移动、重命名、合并、归档或批量改写现有文件。
- 选择性覆盖冲突观点、改变既有项目决策或把低置信度内容升级为事实。
- 提交本次开始前就存在的修改，或修改与整理目标无关的文件。
- 发现 API Key、Token、Cookie、私钥、密码、环境变量值或其他秘密。
- Git 检查、秘密扫描、提交或推送失败后需要绕过保护措施。

## 完成条件

- YAML、标题、文件名、来源和 wikilink 有效。
- 新知识可从 Home、相关地图或项目入口到达。
- `git diff --check` 通过，暂存区只包含本次精确文件，提交钩子通过。
- 成功推送后报告：处理材料、创建知识、更新地图、阻塞项、提交哈希和同步状态。
- 如果没有可安全处理的新增材料，报告“无需整理”，不创建空提交。

返回 [[Home]] 与 [[90 System/Knowledge Base Protocol|知识库协议]]。
