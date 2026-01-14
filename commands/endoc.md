---
description: Generate comprehensive English documentation by analyzing code directly
argument-hint: [optional: specific file or module to document]
model: inherit
allowed-tools: ["Read", "Edit", "Write", "Grep", "Glob", "Task"]
---

# Generate English Documentation

## Target Scope

$ARGUMENTS

If no target specified, document the entire project.

---

## CRITICAL: Preserve Original Request

```
ORIGINAL REQUEST (IMMUTABLE):
$ARGUMENTS

OUTPUT LANGUAGE: English
```

---

## Workflow

### Step 1: Analyze Codebase (You do this)

Understand the project structure:
- Main features and functionality
- API endpoints (if backend)
- Key components (if frontend)
- Configuration requirements
- Project architecture

**Deliverables:**
- [ ] Project structure understood
- [ ] Key files identified
- [ ] Documentation scope defined

---

### Step 2: Delegate to doc-writer Agent (REQUIRED)

**You MUST use the Task tool to invoke the doc-writer agent.**

```
Task(
  subagent_type="doc-writer",
  description="Generate English technical documentation",
  prompt="..."
)
```

**Context to provide to agent:**
- Original request: [quote from ORIGINAL REQUEST section]
- Target scope: [entire project or specific module]
- Language requirement: English
- Clear instruction: Read code directly, ignore existing potentially outdated docs

**Expected agent deliverables:**

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

**Requirements for agent:**
- Use clear, professional English
- Provide realistic, working code examples
- Ensure documentation accurately reflects current code
- List all files created/modified

**Wait for agent completion before proceeding.**

---

### Step 3: Report to User (You do this)

Summarize in English:

```
## Documentation Complete

### Files Created/Modified
- [file list]

### Documentation Coverage
- Functions documented: X/Y
- API endpoints documented: X/Y
- User guides created: Yes/No

### Sample Snippet
[Show example of generated docs]

### Notes
[Any additional information]
```

---

**Make sure to use the doc-writer agent - do not generate documentation yourself!**
