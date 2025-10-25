---
description: Generate comprehensive Chinese documentation by analyzing code directly
argument-hint: [optional: specific file or module to document]
model: inherit
---

# Generate Chinese Documentation

## Target

$ARGUMENTS

If no target specified, document the entire project.

## Process

### Step 1: Analyze Codebase (You do this)

Understand the project structure:
- Main features and functionality
- API endpoints (if backend)
- Key components (if frontend)
- Configuration requirements
- Project architecture

### Step 2: Use doc-writer Agent (REQUIRED)

Use the **doc-writer** agent to generate comprehensive Chinese (中文) documentation.

Provide the agent with:
- Target scope (entire project or specific module)
- Language requirement: Chinese (中文)
- Clear instruction: Read code directly, ignore existing docs

The agent should generate:

**For Backend Projects:**
- API-REFERENCE-zh.md (API 参考文档)
  - 所有端点的详细说明
  - 请求/响应格式和示例
  - 认证要求和错误代码

**For Frontend Projects:**
- 组件文档
  - 组件功能说明、Props、使用示例

**For All Projects:**
- README-zh.md (项目概述、安装、快速开始、配置)
- 关键函数的中文 JSDoc/Docstring 注释
- USAGE-zh.md (使用指南) if needed

**Requirements:**
- 使用清晰、专业的中文术语
- 提供实际可运行的代码示例
- 确保文档准确反映当前代码功能
- 列出所有创建/修改的文件

### Step 3: Report to User (You do this)

Summarize in Chinese:
- 已创建/修改的文件列表
- 文档覆盖范围
- 生成文档的示例片段

Make sure to use the doc-writer agent - do not generate documentation yourself!
