---
type: source
status: seed
created: 2026-08-11
updated: 2026-08-11
aliases:
  - Testkube 架构资料
tags:
  - TestOps
  - Testkube
  - 测试执行
  - Kubernetes
source_url: "https://github.com/kubeshop/testkube"
author: "Kubeshop / Testkube"
published: ""
accessed: 2026-08-11
confidence: high
---

# Testkube 官方仓库与架构文档

## 来源

- GitHub 仓库：https://github.com/kubeshop/testkube
- 官方文档：https://docs.testkube.io/
- Agent 架构：https://github.com/kubeshop/testkube/blob/main/ARCHITECTURE.md

## 摘要

Testkube 是面向 Kubernetes 环境的测试执行与编排平台。其整体形态由一个 Control Plane 和部署在目标基础设施中的多个 Agent 组成：Control Plane 集中管理和展示测试，Agent 在靠近被测环境的位置执行 Workflows，并同步结果。

开源 Agent 也可以独立运行。在 Standalone Mode 下，它自己承担调度、触发、结果和制品存储；在 Connected Mode 下，部分核心能力交给 Control Plane，Agent 主要执行下发的 Workflows 并回传结果。

Agent 内部进一步划分为 API Server、Kubernetes Controllers、TestWorkflow Execution Runtime、Storage Layer、Event System、REST API、指标和遥测。官方架构文档列出的持久化与通信组件包括数据库、MinIO 和 NATS，分别承载元数据、制品以及异步事件。

## 可支持的结论

- 跨环境测试执行适合采用集中控制面与分布式 Agent 的边界。
- 测试运行时需要独立处理执行生命周期、日志流、制品收集和结果聚合。
- API、事件和声明式资源可作为控制面与执行面的稳定契约。

## 局限

- Testkube 主要面向 Kubernetes 和自动化测试编排，不等同于完整的用例治理平台。
- 开源 Agent 与商业 Control Plane 的能力边界不同，不能把商业能力默认视为开源仓库能力。

## 关联

- [[20 Knowledge/成熟 TestOps 平台优先分离职责边界]]：为控制面与分布式执行边界提供实例。
