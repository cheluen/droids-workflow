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

**You will coordinate English documentation generation.**

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
- subagent_type: "doc-writer"
- description: "Generate English documentation for: [target or entire project]"
- prompt: "Generate comprehensive English documentation.

Target: $ARGUMENTS (or entire project if not specified)

**CRITICAL Instructions:**
1. Read code files directly to understand functionality
2. DO NOT rely on existing comments or documentation (may be outdated)
3. Generate fresh documentation based on actual code behavior
4. All documentation must be in English

**Generate:**

For Backend:
- API Reference Documentation (API-REFERENCE.md)
  - Detailed endpoint descriptions
  - Request/response formats with examples
  - Authentication requirements and error codes
  
For Frontend:
- Component Documentation
  - Component functionality, props, usage examples
  
For All Projects:
- README.md (project overview, installation, quick start, configuration)
- JSDoc/Docstring comments for key functions
- Usage Guide (USAGE.md)

**Requirements:**
- Use clear, professional English
- Provide realistic, working code examples
- Ensure documentation accurately reflects current code
- List all files created/modified

Generate from code, not from existing docs."
```

### Step 3: Verify

After documentation is generated:
1. Check that all key areas are documented
2. Verify examples are accurate
3. Ensure documentation is in English

## Output

The doc-writer will report:
- Files created/modified
- Documentation coverage
- Sample of generated docs

You should summarize the results for the user.
