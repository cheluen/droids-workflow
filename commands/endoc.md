---
description: Generate comprehensive English documentation by analyzing code directly
argument-hint: [optional: specific file or module to document]
model: inherit
---

# Generate English Documentation

Generate comprehensive English documentation by analyzing code directly.

## Target

$ARGUMENTS

If no target specified, document the entire project.

## Your Task

Generate English documentation following these steps:

### Step 1: Analyze Project Structure

1. Read the codebase to understand:
   - Main features and functionality
   - API endpoints (if backend)
   - Key components (if frontend)
   - Configuration requirements
   - Project architecture

2. Identify what needs documentation

### Step 2: Use doc-writer Agent

Use the **doc-writer** agent to generate comprehensive English documentation:

**Important Instructions for doc-writer:**
- Read code files directly to understand functionality
- DO NOT rely on existing comments or documentation (may be outdated)
- Generate fresh documentation based on actual code behavior
- All documentation must be in English

**Generate:**

For Backend Projects:
- API Reference Documentation (API-REFERENCE.md)
  - Detailed endpoint descriptions
  - Request/response formats with examples
  - Authentication requirements and error codes

For Frontend Projects:
- Component Documentation
  - Component functionality, props, usage examples

For All Projects:
- README.md (project overview, installation, quick start, configuration)
- JSDoc/Docstring comments for key functions
- Usage Guide (USAGE.md) if needed

**Requirements:**
- Use clear, professional English
- Provide realistic, working code examples
- Ensure documentation accurately reflects current code
- List all files created/modified

### Step 3: Verify

After documentation is generated:
1. Check that all key areas are documented
2. Verify examples are accurate
3. Ensure documentation is in English

## Output

Provide a summary to the user about:
- Files created/modified
- Documentation coverage
- Sample of generated docs
