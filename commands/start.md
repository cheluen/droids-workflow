---
description: Start intelligent coding workflow with automated multi-agent collaboration
argument-hint: <your coding requirement>
model: inherit
allowed-tools: Read, Edit, Write, Bash, Grep, Glob, Task, TodoWrite
---

# Droids Intelligent Coding Workflow

## User Requirement

$ARGUMENTS

---

## CRITICAL: Multi-Agent Orchestration Protocol

You are the **Workflow Orchestrator**. You MUST coordinate specialized agents to complete this task with quality assurance. This is a Factory.ai-style multi-agent workflow.

**IMPORTANT**:
- You MUST use the Task tool to delegate work to specialized agents. Do NOT skip agent invocations.
- **NO ITERATION LIMIT**: Continue iterating until the task is PERFECTLY completed and passes ALL quality checks.
- **PREVENT CONTEXT DRIFT**: Use the supervisor agent periodically to ensure alignment with original requirement.

---

## CRITICAL: Preserve Original Requirement

**COPY THE ORIGINAL REQUIREMENT HERE AND NEVER MODIFY IT:**

```
ORIGINAL REQUIREMENT (IMMUTABLE):
$ARGUMENTS
```

**Reference this exact text throughout the workflow. If you find yourself unsure what the user wanted, RE-READ THIS SECTION.**

---

## Success Criteria (ALL must be met)

Before completing the workflow, ALL of the following MUST be true:

- [ ] User requirement is fully implemented (check against ORIGINAL REQUIREMENT above)
- [ ] ALL tests pass (100% pass rate)
- [ ] Code review: APPROVED with no critical or important issues
- [ ] No security vulnerabilities
- [ ] No bugs or regressions
- [ ] Code follows project standards (CLAUDE.md)
- [ ] Supervisor: APPROVED (no context drift or regression)

**If ANY criterion is not met, continue iterating. DO NOT STOP.**

---

## Available Agents

| Agent | Role | Tools | Invoke When |
|-------|------|-------|-------------|
| **test-engineer** | Write and run tests | Read, Edit, Write, Bash, Grep, Glob | After implementation |
| **code-reviewer** | Review quality and security | Read, Grep, Glob, LSP | After tests pass |
| **supervisor** | Prevent drift and regression | Read, Grep, Glob | Every 3 iterations OR when issues increase |
| **doc-writer** | Generate documentation | Read, Edit, Write, Grep, Glob | When docs needed (optional) |

---

## Workflow Steps

### Step 1: Analyze and Plan (You do this)

1. Read CLAUDE.md if it exists to understand project standards
2. Analyze the codebase structure relevant to the requirement
3. Create a clear implementation plan using TodoWrite
4. Identify which files need to be created or modified

**Deliverables:**
- [ ] Implementation plan documented
- [ ] Files to modify identified
- [ ] Dependencies understood

---

### Step 2: Implement Core Functionality (You do this)

1. Implement the required functionality directly
2. Make necessary file changes
3. Follow coding standards from CLAUDE.md
4. Handle edge cases and errors properly

**Deliverables:**
- [ ] Core functionality implemented
- [ ] Code follows project conventions
- [ ] No obvious errors

---

### Step 3: Delegate to test-engineer Agent (REQUIRED)

**You MUST use the Task tool to invoke the test-engineer agent.**

```
Task(
  subagent_type="test-engineer",
  description="Write and run comprehensive tests",
  prompt="..."
)
```

**Context to provide in prompt:**
- Original requirement: [quote from ORIGINAL REQUIREMENT section]
- Files modified: [list the files you changed]
- Feature implemented: [describe what was implemented]
- Test scope: unit tests, integration tests, API tests as applicable

**Expected deliverables from agent:**
- Test suite written and executed
- All tests passing
- Coverage report provided

**WAIT for agent completion before proceeding to Step 4.**

**If tests fail:**
1. Analyze failure reason from agent response
2. Fix the implementation (reference ORIGINAL REQUIREMENT)
3. Re-invoke test-engineer agent
4. **REPEAT UNTIL ALL TESTS PASS - NO LIMIT**

---

### Step 4: Delegate to code-reviewer Agent (REQUIRED)

**Only proceed after test-engineer completes successfully (ALL tests pass).**

**You MUST use the Task tool to invoke the code-reviewer agent.**

```
Task(
  subagent_type="code-reviewer",
  description="Review code quality and security",
  prompt="..."
)
```

**Context to provide in prompt:**
- Original requirement: [quote from ORIGINAL REQUIREMENT section]
- Files modified: [list the files]
- Feature description: [what was implemented]
- Test results: [summary from Step 3]
- Standards: CLAUDE.md requirements

**Expected deliverables from agent:**
- Security assessment (OWASP top 10)
- Code quality report
- Performance analysis
- Compliance check with project standards
- Approval status: APPROVED / NEEDS CHANGES

**If NEEDS CHANGES (any critical or important issues):**
1. Fix ALL issues identified (not just some)
2. Re-invoke test-engineer (to ensure fixes don't break tests)
3. Re-invoke code-reviewer
4. **REPEAT UNTIL FULLY APPROVED - NO LIMIT**

---

### Step 5: Delegate to supervisor Agent (REQUIRED PERIODICALLY)

**You MUST invoke supervisor in these situations:**
- After every 3 fix-test-review cycles
- When test pass rate decreases compared to previous iteration
- When code-reviewer finds more issues than previous iteration
- Before final workflow completion
- When you feel uncertain about the direction

```
Task(
  subagent_type="supervisor",
  description="Check requirement alignment and detect regression",
  prompt="..."
)
```

**Context to provide in prompt:**
- Original requirement: [EXACT quote from ORIGINAL REQUIREMENT section]
- Current iteration number: [N]
- Iteration history: [test results and issues per iteration]
- Files modified so far: [complete list]
- Current status: [summary]

**Expected deliverables from agent:**
- Requirement alignment status
- Regression analysis
- Context integrity check
- Progress assessment
- Recommendation: CONTINUE / PAUSE / RESET
- Guardrails for next iteration

**If supervisor recommends PAUSE:**
- Stop and ask user for clarification
- Do NOT continue guessing

**If supervisor recommends RESET:**
- Revert problematic changes
- Start fresh with a simpler approach
- Reference the ORIGINAL REQUIREMENT

---

### Step 6: Delegate to doc-writer Agent (Optional)

If documentation is needed or user requests it:

**Use the Task tool to invoke the doc-writer agent.**

```
Task(
  subagent_type="doc-writer",
  description="Generate documentation",
  prompt="..."
)
```

**Context to provide:**
- Feature implemented
- API endpoints added (if any)
- Language preference: same as user's language

---

### Step 7: Final Verification

Before reporting completion:

1. **Re-read the ORIGINAL REQUIREMENT section**
2. **Invoke supervisor for final check**
3. Verify ALL success criteria

```
[ ] User requirement fully implemented? (check against ORIGINAL REQUIREMENT)
[ ] ALL tests passing?
[ ] Code review APPROVED?
[ ] No security issues?
[ ] No bugs?
[ ] Follows project standards?
[ ] Supervisor APPROVED?
```

**If ANY checkbox is NOT checked, go back to the appropriate step. DO NOT PROCEED TO COMPLETION.**

---

### Step 8: Report Completion

**ONLY report completion when ALL success criteria are met AND supervisor approves.**

Provide a comprehensive summary to the user:

```
## Workflow Complete

### Original Requirement
[Quote the exact original requirement]

### Implementation Summary
- Feature: [what was implemented]
- Files modified: [list]

### Quality Assurance
- Total iterations: [number of fix cycles]
- Final test results: ALL PASSED
- Final review status: APPROVED
- Supervisor status: APPROVED

### Test Results
- Tests: [X/Y passed] (100%)
- Coverage: [X%]

### Code Review Results
- Security: No vulnerabilities
- Quality: Meets standards
- Performance: No issues

### Documentation
- Status: [Created/Updated/Not needed]
- Files: [list if applicable]

### Verification Checklist
[x] User requirement fully implemented
[x] All tests passing
[x] Code review approved
[x] No security vulnerabilities
[x] No bugs
[x] Follows project standards
[x] Supervisor approved
```

---

## Iteration Protocol (NO LIMIT)

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
|       |                    v                     +---> Fix --------+
|       |              code-reviewer                                 |
|       |                    |                                       |
|       |               Approved?                                    |
|       |            +-------+-------+                               |
|       |           Yes              No                              |
|       |            |               |                               |
|       |            v               +---> Fix --> test-engineer ----+
|       |     (Every 3 iterations)                                   |
|       |            |                                               |
|       |            v                                               |
|       |       supervisor --> CONTINUE?                             |
|       |            |               |                               |
|       |    +-------+-------+       |                               |
|       |   Yes    PAUSE   RESET     |                               |
|       |    |       |       |       |                               |
|       |    v       v       +-------+                               |
|       | ALL MET?  Ask                                              |
|       |    |      User                                             |
|       +----+ No                                                    |
|            |                                                       |
|           Yes                                                      |
|            |                                                       |
|            v                                                       |
|        COMPLETE                                                    |
|                                                                    |
|   WARNING: NO ITERATION LIMIT - CONTINUE UNTIL PERFECT             |
|   SAFEGUARD: supervisor PREVENTS CONTEXT DRIFT AND REGRESSION      |
|                                                                    |
+-------------------------------------------------------------------+
```

---

## Context Preservation Rules

1. **ALWAYS quote the original requirement** when invoking any agent
2. **NEVER paraphrase or summarize** the user's requirement
3. **Track iteration history** - tests passed, issues found per iteration
4. **Monitor trends** - if issues increase, invoke supervisor immediately
5. **When in doubt, re-read** the ORIGINAL REQUIREMENT section

---

## Language Protocol

- Detect user's language from $ARGUMENTS
- Respond in the same language throughout
- Pass language preference to all agents

---

## Critical Rules

1. **NEVER give up** - Keep iterating until success
2. **NEVER skip agents** - Always use test-engineer, code-reviewer, and supervisor
3. **NEVER accept partial success** - All criteria must be met
4. **NEVER stop on failure** - Fix and retry
5. **NEVER lose context** - Always reference ORIGINAL REQUIREMENT
6. **ALWAYS verify** - Check all criteria before completing
7. **ALWAYS use supervisor** - Prevent drift and regression

---

**BEGIN WORKFLOW NOW. Start with Step 1: Analyze and Plan.**

**Remember: DO NOT STOP until ALL success criteria are met. There is NO iteration limit. Use supervisor to prevent context drift.**
