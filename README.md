# Droids - Claude Code 智能编码工作流系统


> 中文文档 | [English Documentation](./README-en.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-purple)](https://docs.claude.com/en/docs/claude-code/plugins)

Droids 是一个全面的 Claude Code 插件，提供智能编码工作流系统，具有自动化的分析-编码-测试-审查反馈循环。它协调专业的 AI 代理来处理复杂的编码任务，并内置质量保证机制。

## 🌟 特性

- **🔄 闭环反馈控制**：自动迭代直到满足需求并通过质量审核
- **🤖 5 个专业代理**：任务协调、代码分析、测试、审查和文档生成
- **🧪 全面测试**：前端 + 后端测试，确保前后端对齐
- **🔒 质量保证**：自动代码审查，检查安全性、性能和标准合规性
- **📝 多语言文档**：直接从代码生成中文或英文文档
- **🎯 智能协调**：主代理处理核心实现，子代理提供专业支持
- **🌐 多语言支持**：自动使用用户的语言（中文/英文）响应
- **🔧 灵活工具使用**：不限制工具或 MCP 服务器的使用

## 📦 安装

### 方式 1：从插件市场安装（推荐）

```bash
# 在 Claude Code 中执行以下命令
/plugin marketplace add cheluen/droids-workflow
/plugin install droids
```

### 方式 2：手动安装

```bash
# 1. 克隆仓库
git clone https://github.com/cheluen/droids-workflow.git

# 2. 复制到 Claude Code 插件目录
# 项目级别（仅当前项目可用）
mkdir -p .claude/plugins/droids
cp -r droids-workflow/* .claude/plugins/droids/

# 或用户级别（全局可用）
mkdir -p ~/.claude/plugins/droids
cp -r droids-workflow/* ~/.claude/plugins/droids/
```

## 🚀 快速开始

### 启动编码工作流

使用 `/droids:start` 启动智能工作流：

```bash
# 实现新功能
/droids:start 实现基于 JWT 的用户认证

# 为现有代码添加功能
/droids:start 为所有 API 端点添加基于 Redis 的限流功能

# 重构并保证质量
/droids:start 重构支付模块以提高性能
```

### 生成文档

#### 生成中文文档

```bash
# 为整个项目生成中文文档
/droids:cndoc

# 为特定模块生成文档
/droids:cndoc src/api/user
```

#### 生成英文文档

```bash
# 为整个项目生成英文文档
/droids:endoc

# 为特定文件生成文档
/droids:endoc src/services/auth.ts
```

## 🤖 Droids 团队

### 1. 任务协调器 🎯
**角色**：核心协调者和工作流管理器

- 分析需求并创建执行计划
- 协调其他代理和主代理
- 实施闭环反馈控制
- 验证质量并迭代直到满足需求
- 使用 TodoWrite 跟踪进度

**使用场景**：需要协调的复杂编码任务

### 2. 代码分析专家 🔍
**角色**：代码库分析和架构专家

- 分析项目结构和设计模式
- 识别依赖关系和集成点
- 提供实现建议
- 评估技术债务和复杂度
- 建议重构机会

**使用场景**：理解现有代码、规划实现

### 3. 测试工程师 🧪
**角色**：全面测试专家

- 编写单元测试、集成测试和 E2E 测试
- 测试前端和后端
- 验证前后端对齐
- 运行测试并报告覆盖率
- 识别未测试的代码路径

**使用场景**：添加测试覆盖、验证功能

### 4. 代码审查专家 👁️
**角色**：质量保证和安全专家

- 审查代码质量和可维护性
- 识别安全漏洞
- 检查性能问题
- 确保遵守编码标准
- 提供建设性反馈

**使用场景**：合并前审查、安全审计、质量检查

### 5. 文档编写专家 📝
**角色**：文档生成专家

- 生成内联代码注释（JSDoc、docstrings）
- 创建 API 文档
- 编写 README 和使用指南
- 生成架构文档
- 支持中文和英文

**使用场景**：创建或更新文档

## 🔄 工作流架构

```
用户请求
     ↓
主代理（核心实现）
     ↓
任务协调器（协调）
     ↓
[反馈循环开始]
     ↓
代码分析专家 → 分析现有代码
     ↓
主代理 → 实现核心功能
     ↓
测试工程师 → 编写并运行测试（前端 + 后端）
     ↓
代码审查专家 → 审查质量和安全性
     ↓
验证 → 测试通过？质量通过？
     ↓
[否] → 分析问题 → 更新计划 → 重试
     ↓
[是] → 继续生成文档
     ↓
文档编写专家 → 生成文档
     ↓
[反馈循环结束]
     ↓
任务完成
```

## 💡 示例工作流

### 示例 1：实现新功能

```bash
> /droids:start 添加支持 Google 和 GitHub 的 OAuth2 认证

# 发生的事情：
# 1. 任务协调器分析需求
# 2. 代码分析专家研究现有认证系统
# 3. 主代理实现 OAuth2 集成
# 4. 测试工程师编写认证测试
# 5. 代码审查专家检查安全性
# 6. 如果发现问题：迭代并修复
# 7. 文档编写专家生成认证文档
# 8. 完成并通过质量保证
```

### 示例 2：重构并测试

```bash
> /droids:start 重构数据库查询以使用连接池

# 发生的事情：
# 1. 代码分析专家识别所有数据库查询
# 2. 主代理重构以使用连接池
# 3. 测试工程师编写/更新数据库测试
# 4. 代码审查专家检查性能改进
# 5. 如果测试失败则迭代
# 6. 记录新的数据库架构
```

### 示例 3：生成全新文档

```bash
> /droids:cndoc

# 发生的事情：
# 1. 代码分析专家扫描整个代码库
# 2. 文档编写专家直接读取代码（忽略旧文档）
# 3. 生成准确的中文文档
# 4. 创建 README-zh.md、API-REFERENCE-zh.md
# 5. 添加内联中文注释
```

## 🎯 核心优势

### 1. 质量保证
- 多个审查阶段确保高代码质量
- 自动化测试及早捕获错误
- 识别安全漏洞
- 检测性能问题

### 2. 闭环反馈
- 发现问题时自动迭代
- 无需手动来回沟通
- 持续直到满足所有需求
- 防止不完整的实现

### 3. 前后端对齐
- 契约测试确保 API 兼容性
- 数据结构验证
- 错误处理一致性
- 状态同步验证

### 4. 准确文档
- 从实际代码生成，而非过时文档
- 支持中文和英文
- 保持文档与实现同步
- 减少文档技术债

### 5. CLAUDE.md 集成
- 所有代理尊重项目特定规则
- 自动遵循编码标准
- 使用项目的测试框架
- 保持与团队约定的一致性

## 📋 CLAUDE.md 集成

所有 Droids 代理会自动读取并遵循您项目的 `CLAUDE.md` 文件：

```markdown
# CLAUDE.md 示例（Droids 会遵循）

## 技术栈
- TypeScript, React, Node.js, PostgreSQL

## 编码规范
- 使用函数式组件
- TypeScript 严格模式
- 不使用 `any` 类型
- 全面的错误处理

## 测试要求
- 最低 80% 覆盖率
- 使用 Jest 和 React Testing Library
- 关键流程的 E2E 测试

## 文档
- 所有公共函数需要 JSDoc
- API 文档使用 OpenAPI 格式
```

## 🛠️ 配置

Droids 开箱即用，无需配置。但您可以通过项目的 `CLAUDE.md` 自定义行为：

### 自定义测试
```markdown
# CLAUDE.md
## 测试框架
- 后端：Jest + Supertest
- 前端：Vitest + Testing Library
- E2E：Playwright
```

### 自定义代码审查
```markdown
# CLAUDE.md
## 代码审查标准
- 安全性：符合 OWASP Top 10
- 性能：无 N+1 查询问题
- 质量：圈复杂度 < 10
```

### 自定义文档
```markdown
# CLAUDE.md
## 文档标准
- API 文档使用 OpenAPI 3.0 格式
- 内联注释使用中文
- README 提供中英文双语版本
```

## 🔧 高级用法

### 直接访问代理

您也可以直接调用特定代理完成特定任务：

```bash
# 仅分析代码
> 使用 code-analyzer 代理分析认证模块

# 仅编写测试
> 使用 test-engineer 代理为用户服务添加测试

# 仅审查代码
> 使用 code-reviewer 代理审查此 PR 的安全性问题

# 仅生成文档
> 使用 doc-writer 代理记录 API 端点
```

### 与其他工具结合

Droids 与以下工具无缝协作：
- MCP 服务器（数据库、API 等）
- 自定义 slash 命令
- 其他 Claude Code 插件
- CI/CD 工作流

## 📊 工作流监控

任务协调器使用 TodoWrite 跟踪进度：

```
✅ 分析完成
🔄 实现进行中
⏳ 测试待处理
⏳ 审查待处理
⏳ 文档待处理
```

您可以实时监控工作流，看到代理协调和完成任务的过程。

## 🤝 贡献

欢迎贡献！请随时提交 Pull Request。

### 开发设置

```bash
# 克隆仓库
git clone https://github.com/cheluen/droids-workflow.git

# 本地测试
# 复制到 ~/.claude/plugins/droids/ 进行测试
```

## 📄 许可证

MIT 许可证 - 详见 [LICENSE](LICENSE) 文件

## 🔗 链接

- [Claude Code 文档](https://docs.claude.com/en/docs/claude-code/overview)
- [插件开发指南](https://docs.claude.com/en/docs/claude-code/plugins)
- [GitHub 仓库](https://github.com/cheluen/droids-workflow)

## 💬 支持

- **问题反馈**：在 [GitHub Issues](https://github.com/cheluen/droids-workflow/issues) 报告错误或请求功能
- **讨论**：加入 [GitHub Discussions](https://github.com/cheluen/droids-workflow/discussions) 的对话

## 🎉 致谢

为 Claude Code 社区用 ❤️ 构建。

特别感谢：
- Anthropic 提供 Claude Code
- 开源社区
- 早期采用者和贡献者

---

**🤖 由 Droids 团队倾力打造**
