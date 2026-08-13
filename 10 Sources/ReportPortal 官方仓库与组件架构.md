---
type: source
status: seed
created: 2026-08-11
updated: 2026-08-11
aliases:
  - ReportPortal 架构资料
tags:
  - TestOps
  - ReportPortal
  - 结果分析
  - 微服务
source_url: "https://github.com/reportportal/reportportal"
author: "ReportPortal"
published: ""
accessed: 2026-08-11
confidence: high
---

# ReportPortal 官方仓库与组件架构

## 来源

- GitHub 仓库：https://github.com/reportportal/reportportal
- 官方组件文档：https://reportportal.io/docs/installation-steps-advanced/ComponentsOverview/
- 官方产品文档：https://reportportal.io/docs/

## 摘要

ReportPortal 是以自动化测试结果接入、实时报告和分析为中心的 TestOps 平台。测试框架侧通过 client、agent 和 logger 适配器把执行事件、日志与结果发送到服务端，服务端再完成统一存储、搜索、分析和展示。

其服务端采用明确的服务边界：Gateway 负责入口路由和负载均衡，API Service 处理 UI 与 Agent 请求，UAT Service 负责认证，Analyzer Service 处理日志索引与自动分析，Index Service 聚合健康信息，UI Service 提供前端。仓库还列出 RabbitMQ 作为服务间消息总线、MinIO 作为附件存储。

## 可支持的结论

- 结果接入、身份认证、自动分析、对象存储和 UI 可以形成独立演进的能力边界。
- 测试框架适配器应只负责采集并发送标准事件，而不承担平台分析逻辑。
- 当结果规模和分析复杂度上升时，消息总线、搜索索引和专用 Analyzer 有助于隔离负载。

## 局限

- ReportPortal 的核心强项是结果报告、分析和缺陷归类，不是通用测试执行调度。
- 微服务拆分展示的是成熟部署形态，不足以证明小规模 MVP 必须采用相同的物理拆分。

## 关联

- [[20 Knowledge/成熟 TestOps 平台优先分离职责边界]]：为结果分析与服务化边界提供实例。
