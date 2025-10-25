---
description: Generate comprehensive Chinese documentation by analyzing code directly
argument-hint: [optional: specific file or module to document]
model: inherit
---

# Generate Chinese Documentation

Generate comprehensive Chinese (中文) documentation by analyzing code directly.

## Target

$ARGUMENTS

If no target specified, document the entire project.

## Your Task

Generate Chinese documentation following these steps:

### Step 1: Analyze Project Structure

1. Read the codebase to understand:
   - Main features and functionality
   - API endpoints (if backend)
   - Key components (if frontend)
   - Configuration requirements
   - Project architecture

2. Identify what needs documentation

### Step 2: Use doc-writer Agent

Use the **doc-writer** agent to generate comprehensive Chinese documentation:

**Important Instructions for doc-writer:**
- Read code files directly to understand functionality
- DO NOT rely on existing comments or documentation (may be outdated)
- Generate fresh documentation based on actual code behavior
- All documentation must be in Chinese (中文)

**Generate:**

For Backend Projects:
- API 参考文档 (API-REFERENCE-zh.md)
  - 所有端点的详细说明
  - 请求/响应格式和示例
  - 认证要求和错误代码

For Frontend Projects:
- 组件文档
  - 组件功能说明、Props、使用示例

For All Projects:
- README-zh.md (项目概述、安装、快速开始、配置)
- 关键函数的中文 JSDoc/Docstring 注释
- 使用指南 (USAGE-zh.md) if needed

**Requirements:**
- 使用清晰、专业的中文术语
- 提供实际可运行的代码示例
- 确保文档准确反映当前代码功能
- 列出所有创建/修改的文件

### Step 3: Verify

After documentation is generated:
1. Check that all key areas are documented
2. Verify examples are accurate
3. Ensure documentation is in Chinese

## Output

Provide a summary to the user in Chinese about:
- Files created/modified
- Documentation coverage
- Sample of generated docs
