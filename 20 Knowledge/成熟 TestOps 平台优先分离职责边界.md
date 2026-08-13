---
type: concept
status: seed
created: 2026-08-11
updated: 2026-08-11
aliases:
  - TestOps 架构职责分层
  - TestOps 平台逻辑分层
tags:
  - TestOps
  - 平台架构
  - 测试治理
  - 测试执行
  - 结果分析
sources:
  - "[[10 Sources/Testkube 官方仓库与架构文档]]"
  - "[[10 Sources/ReportPortal 官方仓库与组件架构]]"
  - "[[10 Sources/Kiwi TCMS 官方仓库与部署文档]]"
confidence: medium
---

# 成熟 TestOps 平台优先分离职责边界

## 核心结论

成熟 TestOps 平台的共同点不是采用相同技术栈或微服务数量，而是清晰分离测试治理、执行编排与结果分析三类职责。各层应通过 API、事件和制品协议连接；是否拆成独立服务，应由规模、负载和团队能力决定。

## 说明

三个成熟开源项目分别展示了不同重点：

| 项目 | 主要职责边界 | 架构启示 |
|---|---|---|
| [[10 Sources/Testkube 官方仓库与架构文档|Testkube]] | Control Plane、分布式 Agent、Workflow Runtime、事件与制品 | 执行能力应靠近被测环境，并与集中控制解耦 |
| [[10 Sources/ReportPortal 官方仓库与组件架构|ReportPortal]] | 结果接入、API、认证、分析、搜索、消息和附件存储 | 高吞吐结果处理与分析适合形成独立边界 |
| [[10 Sources/Kiwi TCMS 官方仓库与部署文档|Kiwi TCMS]] | 用例、权限、执行记录、报告、API 和外部集成 | 治理核心可以从模块化单体起步，不必过早微服务化 |

由此可以得到三个逻辑层：

1. **治理层**：项目、用例、版本、审批、权限和审计。
2. **执行层**：任务调度、Runner/Agent、环境隔离、生命周期和取消重试。
3. **结果层**：结构化结果、日志、截图与报告制品、搜索、分析和质量门禁。

对 [[TestOps Platform]] 的启示属于综合推断：保留现有 Control Plane 与 Runner 分离，同时把结果接入和分析定义为明确模块与协议；MVP 可以继续采用模块化后端，只有在吞吐量、独立扩缩容或团队边界出现后再拆分专用服务。

## 冲突与边界

- 三个平台覆盖范围不同，不能把任一项目直接当作完整的目标架构模板。
- Testkube 偏执行编排，ReportPortal 偏结果分析，Kiwi TCMS 偏测试治理。
- 本结论支持逻辑分层，不等于要求立即引入 Kubernetes、消息队列、搜索集群或大量微服务。

## 关联

- [[TestOps Platform]]：现有方案已采用控制面与执行面分离，本笔记补充了结果层边界与渐进式拆分依据。
- [[20 Knowledge/已发布用例基线必须保持只读]]：已发布基线保护属于治理层的核心约束。
