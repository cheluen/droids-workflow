---
description: Generate comprehensive Chinese documentation by analyzing code directly, ignoring existing comments and docs to ensure accuracy
argument-hint: [optional: specific file or module to document]
model: inherit
---

# Generate Chinese Documentation from Code

You are initiating the **Chinese Documentation Generation** workflow.

## Target for Documentation

$ARGUMENTS

If no specific target provided, document the entire project.

## Your Task

Launch the **doc-writer** agent to generate comprehensive Chinese documentation by analyzing code directly.

### Step-by-Step Instructions

1. **First, launch the code-analyzer agent** to understand the project structure:

   **Call the Task tool** with:
   - **subagent_type**: `"code-analyzer"`
   - **description**: `"Analyze codebase structure for Chinese documentation generation"`
   - **prompt**:
   ```
   Analyze the project structure and identify all components that need documentation.

   Focus on:
   1. Main features and functionality
   2. API endpoints (if backend)
   3. Key components (if frontend)
   4. Core utilities and services
   5. Data models and schemas
   6. Configuration requirements

   Target: $ARGUMENTS (or entire project if not specified)

   Provide a comprehensive analysis that will guide Chinese documentation generation.
   
   Output in English for precision (the doc-writer will generate Chinese docs).
   ```

2. **Then, launch the doc-writer agent** for Chinese documentation:

   **Call the Task tool** with:
   - **subagent_type**: `"doc-writer"`
   - **description**: `"Generate comprehensive Chinese documentation from code analysis"`
   - **prompt**:
   ```
   Generate comprehensive documentation in Chinese (中文) based on direct code analysis.

   Target: $ARGUMENTS (or entire project if not specified)

   **IMPORTANT Instructions:**
   1. **Read code directly**: Analyze source code files to understand functionality
   2. **Ignore existing documentation**: Do NOT rely on existing comments, docs, or README
      - Existing docs may be outdated or incorrect
      - Generate fresh documentation from actual code behavior
   3. **Ensure accuracy**: Documentation must match current implementation exactly
   4. **Language**: All documentation must be in Chinese (中文)
   5. **Use code-analyzer results**: Leverage the analysis from code-analyzer agent

   **Documentation to Generate:**

   ### For Backend Projects:
   - API 参考文档 (API Reference)
     - 所有端点的详细说明
     - 请求/响应格式
     - 认证要求
     - 错误代码
     - 示例代码
   
   - 使用指南 (Usage Guide)
     - 快速开始
     - 配置说明
     - 环境变量
   
   - 代码注释 (Inline Comments)
     - 为关键函数添加中文 JSDoc/Docstring
     - 解释复杂逻辑

   ### For Frontend Projects:
   - 组件文档 (Component Documentation)
     - 组件功能说明
     - Props 参数
     - 使用示例
   
   - 使用指南 (Usage Guide)
     - 项目结构说明
     - 开发环境配置
     - 构建和部署
   
   - 代码注释 (Inline Comments)
     - 为关键组件添加中文注释
     - 解释状态管理逻辑

   ### For Full-Stack Projects:
   - 完整的 API 文档（中文）
   - 前端组件文档（中文）
   - 项目 README-zh.md
   - 架构说明文档

   **Output Requirements:**
   1. Create/update README-zh.md with Chinese project overview
   2. Create API-REFERENCE-zh.md (if applicable)
   3. Add inline Chinese comments to key files
   4. Create 使用指南 (USAGE-zh.md) if needed
   5. List all files created/modified

   Remember: 
   - 从代码出发理解项目，不要依赖现有文档
   - 确保文档准确反映实际代码功能
   - 使用清晰、专业的中文术语
   ```

3. **Wait for Completion**: The agents will coordinate to analyze code and generate accurate Chinese documentation.

## What Happens Next

The workflow will:
1. **Code Analyzer** studies the codebase structure
2. **Doc Writer** reads code directly to understand functionality
3. Generates comprehensive Chinese documentation
4. Ignores existing (possibly outdated) docs
5. Creates new documentation that matches actual code behavior
6. Reports all files created/modified

This ensures your Chinese documentation is accurate and up-to-date with the actual implementation.
