---
type: source
status: seed
created: 2026-08-11
updated: 2026-08-11
aliases:
  - Kiwi TCMS 架构资料
tags:
  - TestOps
  - Kiwi-TCMS
  - 测试管理
  - 模块化单体
source_url: "https://github.com/kiwitcms/Kiwi"
author: "Kiwi TCMS"
published: ""
accessed: 2026-08-11
confidence: high
---

# Kiwi TCMS 官方仓库与部署文档

## 来源

- GitHub 仓库：https://github.com/kiwitcms/Kiwi
- 官方文档：https://kiwitcms.readthedocs.io/
- 部署与性能文档：https://kiwitcms.readthedocs.io/en/stable/hardware_performance.html

## 摘要

Kiwi TCMS 是面向手工与自动化测试的开源测试管理系统，提供用例管理、访问控制、缺陷系统集成、可视化报告和 API。官方仓库记录的项目历史始于 2009 年，说明它代表了长期演进的测试治理系统形态。

与分布式执行平台不同，Kiwi TCMS 的默认部署较集中：官方性能文档描述为 Web 应用与数据库以容器方式运行在同一台主机上。应用基于 Django，并通过 API 和插件连接自动化框架及外部缺陷系统。

## 可支持的结论

- 成熟测试治理能力可以先由集中式 Web 应用和数据库承载，不必从第一天拆成大量微服务。
- 权限、用例、执行记录、报告和外部系统集成可以在清晰模块边界下逐步演进。
- 自动化接入 API 与治理核心可以解耦，即使它们暂时部署在同一应用中。

## 局限

- Kiwi TCMS 侧重测试管理，不提供 Testkube 式的跨集群执行 Agent。
- 默认部署形态不能直接外推到超大规模结果流或高并发执行编排场景。

## 关联

- [[20 Knowledge/成熟 TestOps 平台优先分离职责边界]]：说明逻辑分层不要求立即物理拆分为微服务。
