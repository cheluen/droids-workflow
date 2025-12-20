---
name: droids-workflow-orchestration
description: Multi-agent workflow orchestration patterns for coordinating test-engineer, code-reviewer, supervisor, and doc-writer agents. Use when managing complex coding tasks that require multiple specialized agents.
allowed-tools: Read, Edit, Write, Bash, Grep, Glob, Task
---

# Droids Workflow Orchestration

This skill provides patterns for orchestrating multiple specialized agents in a coordinated workflow.

## Core Principle: NEVER STOP UNTIL PERFECT

**There is NO iteration limit.** Continue fixing and re-testing until:
- ALL tests pass (100%)
- Code review is APPROVED
- No security vulnerabilities
- No bugs
- User requirement is fully met
- Supervisor approves (no context drift or regression)

## Critical: Context Preservation

**The #1 cause of workflow failure is losing sight of the original requirement.**

To prevent this:
1. **ALWAYS copy the original requirement** at the start of the workflow
2. **ALWAYS quote it exactly** when invoking any agent
3. **NEVER paraphrase or summarize** the user's words
4. **Use supervisor** to detect when context has drifted

## Agent Roles

| Agent | Role | When to Invoke |
|-------|------|----------------|
| **test-engineer** | Write and run tests | After code implementation |
| **code-reviewer** | Review code quality and security | After tests pass |
| **supervisor** | Prevent context drift and regression | Every 3 iterations, when issues increase, before completion |
| **doc-writer** | Generate documentation | When docs needed (optional) |

## Delegation Protocol

When delegating to an agent, provide:

1. **Original Requirement**: EXACT quote from user (never paraphrase)
2. **Context**: What was done before this step
3. **Scope**: Specific files or features to work on
4. **Requirements**: What the agent must deliver
5. **Iteration Info**: Current iteration number and history

### Delegation Template

```
Use the **{agent-name}** agent to {task description}.

**Original Requirement (EXACT QUOTE):**
"{user's original words}"

**Context:**
- Previous step: {what was done}
- Files modified: {list of files}
- Current iteration: {N}

**Scope:**
- {specific files or modules}

**Requirements:**
- {deliverable 1}
- {deliverable 2}

**Constraints:**
- Follow CLAUDE.md standards
- {other constraints}

**Wait for agent completion before proceeding.**
```

## Workflow Pattern: Infinite Iteration with Supervision

```
+-------------------------------------------------------------------+
|                    INFINITE ITERATION LOOP                         |
|               (Continue until PERFECT completion)                  |
+-------------------------------------------------------------------+
|                                                                    |
|   Implement --> test-engineer --> Tests pass?                      |
|       ^                               |                            |
|       |                    +----------+----------+                 |
|       |                   Yes                    No                |
|       |                    |                     |                 |
|       |                    v                     +--> Fix ---------+
|       |              code-reviewer                                 |
|       |                    |                                       |
|       |               Approved?                                    |
|       |            +-------+-------+                               |
|       |           Yes              No                              |
|       |            |               |                               |
|       |            v               +--> Fix --> test-engineer -----+
|       |     (Every 3 iterations)                                   |
|       |            |                                               |
|       |            v                                               |
|       |       supervisor --> CONTINUE?                             |
|       |            |                                               |
|       |    +-------+-------+-------+                               |
|       |   Yes    PAUSE         RESET                               |
|       |    |       |             |                                 |
|       |    v       v             v                                 |
|       | ALL MET?  Ask User    Revert and restart                   |
|       |    |                                                       |
|       +----+ No                                                    |
|            |                                                       |
|           Yes                                                      |
|            |                                                       |
|            v                                                       |
|        COMPLETE                                                    |
|                                                                    |
|   SAFEGUARD: supervisor PREVENTS CONTEXT DRIFT AND REGRESSION      |
|                                                                    |
+-------------------------------------------------------------------+
```

## Success Criteria (ALL must be met)

Before completing, verify ALL of the following:

```
[ ] User requirement fully implemented? (check against ORIGINAL REQUIREMENT)
[ ] ALL tests passing (100%)?
[ ] Code review APPROVED?
[ ] No security vulnerabilities?
[ ] No bugs or regressions?
[ ] Follows project standards (CLAUDE.md)?
[ ] Supervisor APPROVED?
```

**If ANY checkbox is NOT checked, continue iterating. DO NOT STOP.**

## Supervisor Triggers

Invoke the supervisor agent when:

1. **Periodic Check**: After every 3 fix-test-review cycles
2. **Regression Signal**: Test pass rate decreases
3. **Issue Escalation**: Code-reviewer finds more issues than before
4. **Uncertainty**: When unsure about direction
5. **Final Gate**: Before reporting completion

## Error Handling

### Test Failures
1. Analyze failure reason
2. Fix implementation (reference ORIGINAL REQUIREMENT)
3. Re-invoke test-engineer
4. **REPEAT UNTIL ALL TESTS PASS - NO LIMIT**

### Review Issues
1. Categorize by severity (Critical/Important/Suggestion)
2. Critical issues: MUST fix before proceeding
3. Important issues: MUST fix before proceeding
4. Suggestions: Fix if time permits
5. **REPEAT UNTIL FULLY APPROVED - NO LIMIT**

### Supervisor Recommendations

**If CONTINUE:**
- Apply guardrails provided
- Continue with next iteration

**If PAUSE:**
- Stop immediately
- Ask user for clarification
- Do NOT guess or assume

**If RESET:**
- Revert problematic changes
- Start fresh with simpler approach
- Reference ORIGINAL REQUIREMENT

## Communication Templates

### Starting Workflow
```
Starting Droids workflow for: {requirement}

ORIGINAL REQUIREMENT (PRESERVED):
"{exact user words}"

Workflow steps:
1. [PENDING] Analyze and implement
2. [PENDING] Test with test-engineer
3. [PENDING] Review with code-reviewer
4. [PENDING] Verify with supervisor
5. [PENDING] Document (if needed)

Note: Will iterate until ALL criteria are met. No iteration limit.
Safeguard: supervisor will prevent context drift and regression.
```

### Progress Updates
```
Iteration {N} Complete

Test Results: {X/Y passed}
Review Status: {APPROVED/NEEDS CHANGES}
Issues Found: {count}
Trend: {IMPROVING/STABLE/DEGRADING}

Next Action: {what will be done}

Original Requirement (reminder):
"{exact user words}"
```

### Completion Report
```
## Workflow Complete

### Original Requirement
"{exact user words}"

### Summary
- Implemented: {features}
- Total iterations: {count}
- Tests: ALL PASSED ({coverage}%)
- Review: APPROVED
- Supervisor: APPROVED
- Documentation: {status}

### Verification Checklist
[x] User requirement fully implemented
[x] All tests passing
[x] Code review approved
[x] No security vulnerabilities
[x] No bugs
[x] Follows project standards
[x] Supervisor approved

### Files Modified
- {file list}
```

## Agent Invocation Examples

### Invoke test-engineer
```
Use the **test-engineer** agent to create and run comprehensive tests.

**Original Requirement:**
"{exact user words}"

**Context:**
- Implemented user authentication feature
- Files: src/auth/login.ts, src/auth/register.ts
- Current iteration: 1

**Requirements:**
- Unit tests for all functions
- Integration tests for API endpoints
- Coverage report

**Wait for completion. If tests fail, fix and re-invoke until ALL pass.**
```

### Invoke code-reviewer
```
Use the **code-reviewer** agent to assess code quality.

**Original Requirement:**
"{exact user words}"

**Context:**
- Feature: User authentication
- Tests: 15/15 passed (92% coverage)
- Current iteration: 1

**Requirements:**
- Security review (OWASP top 10)
- Code quality assessment
- Performance analysis
- CLAUDE.md compliance check

**Wait for completion. If issues found, fix ALL, re-test, and re-review.**
```

### Invoke supervisor
```
Use the **supervisor** agent to check requirement alignment and detect regression.

**Original Requirement (EXACT):**
"{exact user words}"

**Iteration History:**
- Iteration 1: 10/15 tests passed, 5 review issues
- Iteration 2: 13/15 tests passed, 3 review issues
- Iteration 3: 15/15 tests passed, 1 review issue

**Files Modified:**
- src/auth/login.ts
- src/auth/register.ts
- tests/auth.test.ts

**Current Status:**
- Tests: ALL PASSING
- Review: 1 minor suggestion remaining

**Request:**
- Verify we are still aligned with original requirement
- Check for any regression
- Recommend: CONTINUE / PAUSE / RESET
```

### Invoke doc-writer
```
Use the **doc-writer** agent to generate documentation.

**Context:**
- Feature: User authentication (implemented, tested, reviewed, supervisor approved)
- Language: {user's language}

**Requirements:**
- API documentation for new endpoints
- JSDoc comments for public functions
- Update README if needed

**Respond in the same language as the user.**
```

## Critical Rules

1. **NEVER give up** - Keep iterating until success
2. **NEVER skip agents** - Always use test-engineer, code-reviewer, and supervisor
3. **NEVER accept partial success** - All criteria must be met
4. **NEVER stop on failure** - Fix and retry
5. **NEVER lose context** - Always reference ORIGINAL REQUIREMENT
6. **ALWAYS verify** - Check all criteria before completing
7. **ALWAYS use supervisor** - Prevent drift and regression
