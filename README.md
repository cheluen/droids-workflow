# Droids - Claude Code 智能编码工作流系统

> 中文文档 | [English Documentation](./README-en.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-purple)](https://docs.claude.com/en/docs/claude-code/plugins)
[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/cheluen/droids-workflow)

Droids 是一个全面的 Claude Code 插件，提供自愈式 CI/CD 工作流系统。它协调专业的 AI 代理（后端工程师、前端工程师、代码审查专家、测试工程师、文档编写专家）来处理复杂的编码任务，并内置质量保证机制，无限迭代直到完美完成。

## 🌟 特性

- **🔄 自愈式 CI/CD**：编码 → 审查 → 测试 → 监督 → 循环直到完美
- **🤖 5 个专业代理**：后端工程师、前端工程师、测试工程师、代码审查专家、文档编写专家
- **🧪 全面测试**：前端 + 后端测试，确保前后端对齐
- **🔒 质量保证**：自动代码审查，检查安全性、性能和标准合规性
- **📝 多语言文档**：直接从代码生成中文或英文文档
- **🎯 智能编排**：主代理负责监督和规则分发，确保需求不偏移
- **🌐 全局规则继承**：自动将 ~/.claude/CLAUDE.md 中的相关规则传递给子代理
- **⚡ 模型优化**：按任务复杂度选择模型，平衡成本与质量

## 📦 安装

### 手动安装

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

# 全栈开发
/droids:start 实现用户登录功能，包含前后端

# 快速测试模式（使用更快的模型）
/droids:start 快速测试用户注册功能
```

### 生成文档

```bash
# 生成中文文档
/droids:cndoc

# 生成英文文档
/droids:endoc

# 为特定模块生成文档
/droids:cndoc src/api/user
```

## 🤖 Droids 团队

### 主代理（协调者 + 监督者）🎯

**角色**：核心协调者、规则分发者、质量监督者

- 读取并理解全局 CLAUDE.md，提取相关规则分发给子代理
- 分析需求，判断涉及后端/前端/全栈
- 编排子代理调用顺序
- 执行监督职责，确保需求不偏移
- 决定是否继续迭代或完成

### 1. 后端工程师 💻
**模型**：inherit（继承调用者）

- 实现 API、数据库操作、业务逻辑
- 处理认证、授权、数据验证
- 集成第三方服务

**使用场景**：后端开发任务

### 2. 前端工程师 🎨
**模型**：sonnet

- 实现 UI 组件、用户交互、状态管理
- 集成后端 API
- 确保响应式和可访问性

**使用场景**：前端开发任务

### 3. 代码审查专家 👁️
**模型**：inherit（继承调用者）

- 审查代码质量和可维护性
- 识别安全漏洞（OWASP Top 10）
- 检查性能问题
- 确保遵守编码标准

**使用场景**：代码审查、安全审计

### 4. 测试工程师 🧪
**模型**：sonnet（默认）/ haiku（快速模式）

- 编写单元测试、集成测试和 E2E 测试
- 测试前端和后端
- 运行测试并报告覆盖率

**使用场景**：添加测试覆盖、验证功能

### 5. 文档编写专家 📝
**模型**：haiku

- 生成内联代码注释（JSDoc、docstrings）
- 创建 API 文档
- 编写 README 和使用指南
- 支持中文和英文

**使用场景**：创建或更新文档

## 🔄 自愈式 CI/CD 工作流

```
用户请求 (/droids:start)
     ↓
主代理读取全局 CLAUDE.md，提取规则
     ↓
主代理分析需求，规划任务
     ↓
┌─────────────────────────────────────────────┐
│              迭代循环                        │
│                                             │
│  [编码阶段] 后端工程师 → 前端工程师          │
│       ↓ （严格串行，后端完成后才调用前端）    │
│  [审查阶段] 代码审查专家                     │
│       ↓                                     │
│  [测试阶段] 测试工程师                       │
│       ↓                                     │
│  [监督阶段] 主代理评估结果                   │
│       ↓                                     │
│  通过？─── 是 ──→ 退出循环                   │
│    │                                        │
│   否                                        │
│    └──→ 修复问题 → 继续循环                  │
│                                             │
└─────────────────────────────────────────────┘
     ↓
[可选] 文档编写专家生成文档
     ↓
任务完成
```

## 💡 示例工作流

### 示例 1：全栈功能开发

```bash
> /droids:start 实现用户登录功能，包含前后端

# 工作流程：
# 1. 主代理读取全局规则，分析需求
# 2. 后端工程师实现 JWT 认证 API
# 3. 前端工程师实现登录表单（等待后端完成）
# 4. 代码审查专家检查安全性
# 5. 测试工程师编写前后端测试
# 6. 主代理监督：检查需求对齐、测试结果
# 7. 如有问题：修复 → 重新审查 → 重新测试
# 8. 全部通过后完成
```

### 示例 2：快速测试模式

```bash
> /droids:start 快速测试支付模块

# 主代理识别"快速"关键词
# 调用 test-engineer 时使用 haiku 模型
# 更快完成测试，节省成本
```

### 示例 3：独立调用代理

```bash
# 直接调用后端工程师
> 使用 backend-engineer 实现 Redis 缓存层

# 直接调用前端工程师
> 使用 frontend-engineer 重构用户仪表盘组件

# 直接调用测试工程师
> 使用 test-engineer 为认证模块添加测试
```

## 🎯 核心优势

### 1. 自愈式 CI/CD
- 编码 → 审查 → 测试 → 监督的闭环
- 发现问题自动修复并重新验证
- 无限迭代直到完美完成

### 2. 智能规则分发
- 主代理读取全局 ~/.claude/CLAUDE.md
- 语义理解，按角色提取相关规则
- 每个子代理只收到相关规则，避免上下文污染

### 3. 严格顺序约束
- 后端必须在前端之前完成
- 避免前后端竞态条件
- 确保 API 契约先于 UI 实现

### 4. 模型成本优化
| 代理 | 模型 | 理由 |
|------|------|------|
| backend-engineer | inherit | 继承调用者，灵活控制 |
| frontend-engineer | sonnet | 需要理解 UI 逻辑 |
| code-reviewer | inherit | 继承调用者 |
| test-engineer | sonnet/haiku | 默认 sonnet，支持快速模式 |
| doc-writer | haiku | 文档任务简单，节省成本 |

### 5. 隔离设计
- 插件只在 `/droids:*` 命令触发时激活
- Skills 标记为 `[DROIDS-INTERNAL]`，不会污染普通会话
- 子代理可独立调用，也可通过工作流编排

## 📋 CLAUDE.md 集成

主代理会自动读取并理解您的全局和项目 CLAUDE.md 文件，将相关规则分发给对应的子代理：

```markdown
# ~/.claude/CLAUDE.md 示例

## 测试相关
- 测试环境和生产环境部署平台必须一致
- 涉及前端必须用 chrome-devtool 测试 UI

## 代码审查相关
- 禁止伪代码和占位符
- 必须 review 代码确保质量

## 通用规则
- 和其他 agent 内部沟通使用英文
- 面向用户的信息使用中文
```

主代理会：
- 将测试相关规则传给 test-engineer
- 将审查相关规则传给 code-reviewer
- 将通用规则传给所有代理

## 🔧 高级用法

### 快速测试模式

在请求中包含"快速"、"fast"等关键词：

```bash
/droids:start 快速验证登录功能
```

test-engineer 将使用 haiku 模型，更快完成测试。

### 直接访问代理

```bash
# 后端开发
> 使用 backend-engineer 实现支付 API

# 前端开发
> 使用 frontend-engineer 实现购物车组件

# 代码审查
> 使用 code-reviewer 审查最近的 PR

# 测试
> 使用 test-engineer 为用户模块添加测试

# 文档
> 使用 doc-writer 生成 API 文档
```

## 📊 工作流监控

主代理使用 TodoWrite 跟踪进度：

```
✅ 需求分析完成
✅ 后端实现完成
✅ 前端实现完成
🔄 代码审查进行中
⏳ 测试待处理
⏳ 监督评估待处理
```

## 🤝 贡献

欢迎贡献！请随时提交 Pull Request。

```bash
# 克隆仓库
git clone https://github.com/cheluen/droids-workflow.git

# 本地测试
cp -r droids-workflow ~/.claude/plugins/droids
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

---

**🤖 由 Droids 团队倾力打造 - v2.0.0**
