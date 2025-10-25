---
description: Generate comprehensive English documentation by analyzing code directly
argument-hint: [optional: specific file or module to document]
model: inherit
---

# Generate English Documentation

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

Use the **doc-writer** agent to generate comprehensive English documentation.

Provide the agent with:
- Target scope (entire project or specific module)
- Language requirement: English
- Clear instruction: Read code directly, ignore existing docs

The agent should generate:

**For Backend Projects:**
- API-REFERENCE.md (API Reference Documentation)
  - Detailed endpoint descriptions
  - Request/response formats with examples
  - Authentication requirements and error codes

**For Frontend Projects:**
- Component Documentation
  - Component functionality, props, usage examples

**For All Projects:**
- README.md (project overview, installation, quick start, configuration)
- JSDoc/Docstring comments for key functions
- USAGE.md (Usage Guide) if needed

**Requirements:**
- Use clear, professional English
- Provide realistic, working code examples
- Ensure documentation accurately reflects current code
- List all files created/modified

### Step 3: Report to User (You do this)

Summarize:
- List of files created/modified
- Documentation coverage
- Sample snippets of generated docs

Make sure to use the doc-writer agent - do not generate documentation yourself!
