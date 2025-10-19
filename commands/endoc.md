---
description: Generate comprehensive English documentation by analyzing code directly, ignoring existing comments and docs to ensure accuracy
argument-hint: [optional: specific file or module to document]
model: inherit
---

# Generate English Documentation from Code

You are initiating the **English Documentation Generation** workflow.

## Target for Documentation

$ARGUMENTS

If no specific target provided, document the entire project.

## Your Task

Launch the **doc-writer** agent to generate comprehensive English documentation by analyzing code directly.

### Step-by-Step Instructions

1. **First, launch the code-analyzer agent** to understand the project structure:

   **Call the Task tool** with:
   - **subagent_type**: `"code-analyzer"`
   - **description**: `"Analyze codebase structure for English documentation generation"`
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

   Provide a comprehensive analysis that will guide English documentation generation.
   ```

2. **Then, launch the doc-writer agent** for English documentation:

   **Call the Task tool** with:
   - **subagent_type**: `"doc-writer"`
   - **description**: `"Generate comprehensive English documentation from code analysis"`
   - **prompt**:
   ```
   Generate comprehensive documentation in English based on direct code analysis.

   Target: $ARGUMENTS (or entire project if not specified)

   **IMPORTANT Instructions:**
   1. **Read code directly**: Analyze source code files to understand functionality
   2. **Ignore existing documentation**: Do NOT rely on existing comments, docs, or README
      - Existing docs may be outdated or incorrect
      - Generate fresh documentation from actual code behavior
   3. **Ensure accuracy**: Documentation must match current implementation exactly
   4. **Language**: All documentation must be in English
   5. **Use code-analyzer results**: Leverage the analysis from code-analyzer agent

   **Documentation to Generate:**

   ### For Backend Projects:
   - API Reference Documentation
     - Detailed endpoint descriptions
     - Request/response formats
     - Authentication requirements
     - Error codes and messages
     - Code examples (cURL, JavaScript, Python)
   
   - Usage Guide
     - Quick start guide
     - Configuration instructions
     - Environment variables
     - Deployment guide
   
   - Inline Comments
     - JSDoc/Docstring for key functions
     - Complex logic explanations

   ### For Frontend Projects:
   - Component Documentation
     - Component functionality
     - Props and parameters
     - Usage examples
     - State management
   
   - Usage Guide
     - Project structure explanation
     - Development setup
     - Build and deployment
   
   - Inline Comments
     - Comments for key components
     - State management logic explanations

   ### For Full-Stack Projects:
   - Complete API documentation (English)
   - Frontend component documentation (English)
   - Project README.md
   - Architecture documentation
   - Integration guides

   **Output Requirements:**
   1. Create/update README.md with English project overview
   2. Create API-REFERENCE.md (if applicable)
   3. Add inline English comments to key files
   4. Create USAGE.md if needed
   5. Create ARCHITECTURE.md for system design (if complex project)
   6. List all files created/modified

   **Documentation Standards:**
   - Use clear, professional English
   - Follow industry-standard terminology
   - Provide realistic, working examples
   - Include troubleshooting sections
   - Add quick start guides
   - Document all configuration options

   Remember: 
   - Generate documentation from code, not from existing docs
   - Ensure documentation accurately reflects actual code functionality
   - Use clear, concise English
   - Follow technical writing best practices
   ```

3. **Wait for Completion**: The agents will coordinate to analyze code and generate accurate English documentation.

## What Happens Next

The workflow will:
1. **Code Analyzer** studies the codebase structure
2. **Doc Writer** reads code directly to understand functionality
3. Generates comprehensive English documentation
4. Ignores existing (possibly outdated) docs
5. Creates new documentation that matches actual code behavior
6. Reports all files created/modified

This ensures your English documentation is accurate and up-to-date with the actual implementation.
