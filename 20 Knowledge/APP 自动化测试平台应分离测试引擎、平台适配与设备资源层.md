---
type: concept
status: seed
created: 2026-08-19
updated: 2026-08-19
aliases:
  - 移动端自动化测试分层架构
  - APP 测试执行与设备资源分层
tags:
  - APP
  - 移动端测试
  - TestOps
  - 平台架构
  - 自动化执行
sources:
  - "[[10 Sources/2026-08-19 APP 自动化测试项目调研]]"
confidence: medium
---

# APP 自动化测试平台应分离测试引擎、平台适配与设备资源层

## 核心结论

成熟的 APP 自动化项目表明，平台不应把用例表达、平台动作、设备调度和结果治理揉成一个进程；更稳妥的架构是将测试引擎、平台适配器、设备资源层和结果制品层通过明确协议连接，再由 TestOps 控制面统一管理版本、审批和任务。

## 说明

从公开项目可以抽出四个逻辑层：

1. **测试引擎层**：承载用例和断言，例如 Maestro 的 YAML Flow、Detox 的 JavaScript/Jest、AndroidX Test 的 JUnit/Espresso，或 Appium 客户端发出的 WebDriver 命令。
2. **平台适配层**：把通用意图翻译为平台动作，例如 Appium Driver、Detox Native Client、Android instrumentation 和 idb companion。该层应独立版本化并声明支持的系统、应用类型和能力。
3. **设备资源层**：负责模拟器/真机的能力匹配、租约、并发、清理、健康检查和分片，例如 Marathon 的 device pools/sharding 或 Appium Device Farm 的会话分配。
4. **结果制品层**：统一接收结构化结果、日志、截图、视频、Trace 和设备诊断，供 TestOps 控制面检索、审计和质量门禁。

对 [[TestOps Platform]] 的直接落地方式是：保留控制面与 Runner 分离，新增 `MobileAppiumAdapter` 作为第一条移动端适配路径，并把 `device_profile`、`adapter_version`、`app_binary_hash` 和 `case_baseline` 固化到每次运行快照；React Native 项目再按需增加 Detox，Android 原生组件测试再接 AndroidX Test。

这种分层既允许 Appium、Maestro、Detox 和 AndroidX Test 共存，也避免把设备租约、重试和清理逻辑写进业务用例。它是对 [[20 Knowledge/成熟 TestOps 平台优先分离职责边界]] 的移动端具体化，而不是要求同时部署所有框架。

## 冲突与边界

- Appium 的跨平台优势来自 WebDriver 与驱动生态，但它不替代测试运行器、断言库或设备农场。
- Maestro 的低门槛黑盒流程、Detox 的 React Native 灰盒同步、AndroidX Test 的原生 instrumentation 面向不同问题，不能用一套选择器和等待策略强行统一。
- 真机资源和 iOS 构建/签名需要专门的节点与权限；设备农场的并发能力、日志视频和清理策略必须在目标环境复核。
- `MobileAppiumAdapter` 是架构建议，不是已经在当前项目中实现的功能。

## 关联

- [[10 Sources/2026-08-19 APP 自动化测试项目调研]]：记录 Appium、Maestro、Detox、AndroidX Test、idb、Poco、Marathon 和 Device Farm 的来源证据。
- [[20 Knowledge/成熟 TestOps 平台优先分离职责边界]]：提供治理、执行和结果三层的上位架构原则。
- [[TestOps Platform]]：现有平台的 App 测试目标和 `MobileAppiumAdapter` 规划入口。
