---
description: Start intelligent coding workflow with automated testing and code review
argument-hint: <your coding requirement>
model: inherit
---

# Droids Coding Workflow

## User Requirement

$ARGUMENTS

## Workflow Overview

You will coordinate specialized agents to complete this coding task with quality assurance. After implementing the core functionality yourself, you MUST use the following agents:

1. **test-engineer** agent - For comprehensive testing
2. **code-reviewer** agent - For quality and security review
3. **doc-writer** agent (optional) - For documentation

## Step-by-Step Process

### Step 1: Analyze & Plan (You do this)

1. Read CLAUDE.md if it exists to understand project standards
2. Analyze the codebase structure relevant to the requirement
3. Create a clear implementation plan
4. Use TodoWrite to track your plan

### Step 2: Implement Core Functionality (You do this)

1. Implement the required functionality directly
2. Make necessary file changes
3. Follow coding standards from CLAUDE.md
4. Handle edge cases and errors properly

### Step 3: Use test-engineer Agent (REQUIRED)

After implementation, use the **test-engineer** agent to write and run comprehensive tests.

Provide the agent with:
- The implemented code/feature
- Test requirements: backend tests (unit, integration, API), frontend tests (component, E2E), contract tests

The agent should:
- Write tests following project patterns
- Run all tests
- Report coverage and results

### Step 4: Use code-reviewer Agent (REQUIRED)

After tests pass, use the **code-reviewer** agent to assess code quality.

Provide the agent with:
- The implemented code
- Test results from step 3

The agent should check:
- Security vulnerabilities
- Code quality and maintainability
- Performance issues
- Standards compliance with CLAUDE.md

### Step 5: Iterate if Needed

- If tests fail: Fix the code and re-run test-engineer agent
- If review finds critical issues: Address them, then re-test and re-review
- Maximum 3 iterations

### Step 6: Use doc-writer Agent (Optional)

If documentation is needed, use the **doc-writer** agent.

The agent should:
- Add inline comments (JSDoc/docstring) for key functions
- Create/update API documentation
- Update README if needed

### Step 7: Report Completion

Provide a summary to the user including:
- What was implemented
- Test results (all passing)
- Code review results (approved)
- Any documentation created

## Important Notes

- **You must use the agents** - Don't skip the test-engineer and code-reviewer steps
- Detect user's language and respond in the same language (Chinese/中文 or English)
- Keep the user informed with clear progress updates
- Follow CLAUDE.md standards throughout

Start now by analyzing the requirement and creating your implementation plan!
