---
description: Start intelligent coding workflow with automated multi-agent collaboration
argument-hint: <your coding requirement>
model: inherit
allowed-tools: ["Read", "Edit", "Write", "Bash", "Grep", "Glob", "Task", "TodoWrite"]
---

# Droids Intelligent Coding Workflow

## User Requirement

$ARGUMENTS

---

## CRITICAL: Preserve Original Requirement

**COPY THE ORIGINAL REQUIREMENT HERE AND NEVER MODIFY IT:**

```
ORIGINAL REQUIREMENT (IMMUTABLE):
$ARGUMENTS
```

**Reference this exact text throughout the workflow. If you find yourself unsure what the user wanted, RE-READ THIS SECTION.**

---

## Pre-flight: Global Context Inheritance

Before starting the workflow:

1. **Read global configuration**: `~/.claude/CLAUDE.md` (if exists)
2. **Understand and extract rules semantically** - use your judgment to determine which rules are relevant to each subagent based on their role
3. **For each subagent invocation**: Include only the relevant global rules in the Task prompt
   - Backend rules → backend-engineer
   - Frontend rules → frontend-engineer
   - Testing rules → test-engineer
   - Review/security rules → code-reviewer
   - Documentation rules → doc-writer
   - Universal rules → all agents

This ensures subagents operate under the same constraints as the main session without context pollution.

---

## Success Criteria (ALL must be met)

Before completing the workflow, ALL of the following MUST be true:

- [ ] User requirement is fully implemented (check against ORIGINAL REQUIREMENT above)
- [ ] ALL tests pass (100% pass rate)
- [ ] Code review: APPROVED with no critical or important issues
- [ ] No security vulnerabilities
- [ ] No bugs or regressions
- [ ] Code follows project standards (CLAUDE.md)

**If ANY criterion is not met, continue iterating. DO NOT STOP.**

---

## Available Agents

| Agent | Role | Model | Invoke When |
|-------|------|-------|-------------|
| **backend-engineer** | Backend development | inherit | Backend implementation needed |
| **frontend-engineer** | Frontend development | sonnet | Frontend implementation needed |
| **code-reviewer** | Code quality review | inherit | After coding phase |
| **test-engineer** | Write and run tests | sonnet (default) / haiku (fast) | After review phase |
| **doc-writer** | Generate documentation | haiku | When docs needed (anytime) |

---

## Self-Healing CI/CD Workflow

```
┌─────────────────────────────────────────────────────────────────┐
│                    ITERATION LOOP                                │
│              (Continue until ALL criteria met)                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  CODING → REVIEW → TEST → SUPERVISE → (loop or complete)        │
│                                                                  │
│  1. Coding Phase (sequential, NOT parallel)                      │
│     └─ backend-engineer → wait → frontend-engineer → wait       │
│                                                                  │
│  2. Review Phase                                                 │
│     └─ code-reviewer → wait for APPROVED/NEEDS CHANGES          │
│                                                                  │
│  3. Testing Phase                                                │
│     └─ test-engineer → wait for results                         │
│                                                                  │
│  4. Supervision Phase (Main Agent)                               │
│     └─ Evaluate results → decide CONTINUE or COMPLETE           │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Workflow Steps

### Step 1: Analyze and Plan

1. Read CLAUDE.md if it exists to understand project standards
2. Read ~/.claude/CLAUDE.md to extract global rules for subagents
3. Analyze the codebase structure relevant to the requirement
4. Determine if task involves: backend only / frontend only / fullstack
5. Create a clear implementation plan using TodoWrite
6. Identify which files need to be created or modified

**Deliverables:**
- [ ] Implementation plan documented
- [ ] Scope determined (backend/frontend/fullstack)
- [ ] Files to modify identified

---

### Step 2: Coding Phase (SEQUENTIAL - NO PARALLEL CALLS)

**CRITICAL: Backend must complete before frontend starts. NEVER call them in parallel.**

#### 2a. Backend Implementation (if needed)

```
Task(
  subagent_type="backend-engineer",
  description="Implement backend functionality",
  prompt="""
  **Global Rules (extracted from ~/.claude/CLAUDE.md):**
  [Insert relevant backend rules here]

  **Original Requirement:**
  [Quote from ORIGINAL REQUIREMENT section]

  **Task Context:**
  - Files to modify: [list]
  - Dependencies: [list]

  **Requirements:**
  - Implement the backend functionality as specified
  - Follow project standards from CLAUDE.md
  - Report all files created/modified

  **Wait for completion before proceeding.**
  """
)
```

**WAIT for backend-engineer to complete before calling frontend-engineer.**

#### 2b. Frontend Implementation (if needed)

**Only proceed after backend-engineer completes.**

```
Task(
  subagent_type="frontend-engineer",
  description="Implement frontend functionality",
  prompt="""
  **Global Rules (extracted from ~/.claude/CLAUDE.md):**
  [Insert relevant frontend rules here]

  **Original Requirement:**
  [Quote from ORIGINAL REQUIREMENT section]

  **Backend Context:**
  - API endpoints created: [from backend output]
  - Data structures: [from backend output]

  **Task Context:**
  - Files to modify: [list]
  - Components needed: [list]

  **Requirements:**
  - Implement frontend components as specified
  - Integrate with backend APIs
  - Follow project standards from CLAUDE.md
  - Report all files created/modified

  **Wait for completion before proceeding.**
  """
)
```

---

### Step 3: Review Phase

**Only proceed after coding phase completes.**

```
Task(
  subagent_type="code-reviewer",
  description="Review code quality and security",
  prompt="""
  **Global Rules (extracted from ~/.claude/CLAUDE.md):**
  [Insert relevant review/security rules here]

  **Original Requirement:**
  [Quote from ORIGINAL REQUIREMENT section]

  **Files Modified:**
  [Complete list of files changed in coding phase]

  **Requirements:**
  - Security review (OWASP top 10)
  - Code quality assessment
  - Performance analysis
  - CLAUDE.md compliance check
  - Provide: APPROVED or NEEDS CHANGES with specific issues

  **Wait for completion before proceeding.**
  """
)
```

**If NEEDS CHANGES:** Go back to Step 2, fix issues, then re-review.

---

### Step 4: Testing Phase

**Only proceed after review phase completes with APPROVED or after fixing review issues.**

```
Task(
  subagent_type="test-engineer",
  description="Write and run comprehensive tests",
  prompt="""
  **Global Rules (extracted from ~/.claude/CLAUDE.md):**
  [Insert relevant testing rules here]

  **Original Requirement:**
  [Quote from ORIGINAL REQUIREMENT section]

  **What to Test:**
  - Feature implemented: [description]
  - Files modified: [list]
  - API endpoints: [list if applicable]
  - Components: [list if applicable]

  **Test Scope:**
  - Unit tests for new functions
  - Integration tests for API endpoints
  - Component tests for UI elements
  - E2E tests for critical user flows

  **Requirements:**
  - Write comprehensive tests
  - Run all tests
  - Report results with pass/fail counts
  - Report coverage percentage

  **Wait for completion before proceeding.**
  """
)
```

**For fast mode:** If user mentions "quick", "fast", "快速", add `model="haiku"` to the Task call.

---

### Step 5: Supervision Phase (Main Agent)

**You (main agent) perform this step directly. Do NOT delegate to a subagent.**

Evaluate the test results:

1. **Check test results:**
   - Did all tests pass?
   - Is coverage acceptable?

2. **Check requirement alignment:**
   - Re-read the ORIGINAL REQUIREMENT section
   - Does the implementation fully satisfy the requirement?
   - Any scope creep or missing features?

3. **Check for regression:**
   - Did we break any existing functionality?
   - Are there any new issues introduced?

4. **Decision:**
   - **All criteria met** → Proceed to Step 6 (completion)
   - **Tests failed** → Go back to Step 2, fix issues
   - **Review issues** → Go back to Step 2, fix issues
   - **Stuck after 5+ iterations** → PAUSE and ask user for clarification

---

### Step 6: Documentation (Optional)

If documentation is needed or user requests it:

```
Task(
  subagent_type="doc-writer",
  description="Generate documentation",
  prompt="""
  **Global Rules (extracted from ~/.claude/CLAUDE.md):**
  [Insert relevant documentation rules here]

  **Feature Implemented:**
  [Description of what was built]

  **Files to Document:**
  [List of files]

  **Language:**
  [Same language as user's request - Chinese or English]

  **Requirements:**
  - Generate appropriate documentation
  - Add inline comments where needed
  - Update README if applicable
  """
)
```

**Note:** doc-writer can be called at any point during the workflow when documentation is needed.

---

### Step 7: Report Completion

**ONLY report completion when ALL success criteria are met.**

Provide a comprehensive summary:

```
## Workflow Complete

### Original Requirement
[Quote the exact original requirement]

### Implementation Summary
- Feature: [what was implemented]
- Backend: [files modified]
- Frontend: [files modified]

### Quality Assurance
- Total iterations: [number of fix cycles]
- Final test results: ALL PASSED
- Final review status: APPROVED

### Test Results
- Tests: [X/Y passed] (100%)
- Coverage: [X%]

### Code Review Results
- Security: No vulnerabilities
- Quality: Meets standards
- Performance: No issues

### Verification Checklist
[x] User requirement fully implemented
[x] All tests passing
[x] Code review approved
[x] No security vulnerabilities
[x] No bugs
[x] Follows project standards
```

---

## Critical Rules

1. **NEVER call backend-engineer and frontend-engineer in parallel** - backend must complete first
2. **NEVER skip agents** - always use code-reviewer and test-engineer
3. **NEVER accept partial success** - all criteria must be met
4. **NEVER stop on failure** - fix and retry
5. **NEVER lose context** - always reference ORIGINAL REQUIREMENT
6. **ALWAYS pass relevant global rules** to each subagent
7. **ALWAYS pass task context** to test-engineer (what to test)
8. **ALWAYS verify** - check all criteria before completing

---

## Language Protocol

- Detect user's language from $ARGUMENTS
- Respond in the same language throughout
- Pass language preference to doc-writer

---

**BEGIN WORKFLOW NOW. Start with Step 1: Analyze and Plan.**

**Remember: This is a self-healing CI/CD loop. Continue iterating until ALL success criteria are met.**
