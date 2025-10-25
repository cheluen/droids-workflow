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

**You will coordinate Chinese documentation generation.**

### Step 1: Analyze Project Structure (You do this)

1. Read the codebase to understand structure:
   - Main features and functionality
   - API endpoints (if backend)
   - Key components (if frontend)
   - Configuration requirements

2. Identify what needs documentation

### Step 2: Generate Documentation (Use doc-writer agent)

Launch the doc-writer agent:

```
Task tool parameters:
- subagent_type: "droids:doc-writer"
- description: "Generate Chinese documentation for: [target or entire project]"
- prompt: "Generate comprehensive Chinese (中文) documentation.

Target: $ARGUMENTS (or entire project if not specified)

**CRITICAL Instructions:**
1. Read code files directly to understand functionality
2. DO NOT rely on existing comments or documentation (may be outdated)
3. Generate fresh documentation based on actual code behavior
4. All documentation must be in Chinese (中文)

**Generate:**

For Backend:
- API 参考文档 (API-REFERENCE-zh.md)
  - 所有端点的详细说明
  - 请求/响应格式和示例
  - 认证要求和错误代码
  
For Frontend:
- 组件文档
  - 组件功能说明、Props、使用示例
  
For All Projects:
- README-zh.md (项目概述、安装、快速开始、配置)
- 关键函数的中文 JSDoc/Docstring 注释
- 使用指南 (USAGE-zh.md)

**Requirements:**
- 使用清晰、专业的中文术语
- 提供实际可运行的代码示例
- 确保文档准确反映当前代码功能
- 列出所有创建/修改的文件

从代码出发理解项目，不依赖现有文档。"
```

### Step 3: Verify

After documentation is generated:
1. Check that all key areas are documented
2. Verify examples are accurate
3. Ensure documentation is in Chinese

## Output

The doc-writer will report:
- Files created/modified
- Documentation coverage
- Sample of generated docs

You should summarize the results for the user in Chinese.
