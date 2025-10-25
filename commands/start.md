---
description: Start intelligent coding workflow with automated testing and code review
argument-hint: <your coding requirement>
model: inherit
---

# Droids Coding Workflow

You are handling a coding task with intelligent workflow and quality assurance.

## User Requirement

$ARGUMENTS

## Your Task

Implement the user's requirement following this structured workflow:

### Phase 1: Analyze & Plan

1. Read CLAUDE.md if it exists to understand project standards
2. Analyze the codebase structure relevant to the requirement
3. Create a clear implementation plan
4. Use TodoWrite to track your plan

### Phase 2: Implement

1. Implement the core functionality directly
2. Make necessary file changes
3. Follow coding standards from CLAUDE.md
4. Handle edge cases and errors properly

### Phase 3: Test (Use test-engineer agent)

After implementation, use the **test-engineer** agent to write and run comprehensive tests:

- Backend tests (if applicable): unit tests, integration tests, API tests
- Frontend tests (if applicable): component tests, E2E tests
- Contract tests: verify frontend-backend API alignment
- Run tests and report coverage

### Phase 4: Review (Use code-reviewer agent)

After tests pass, use the **code-reviewer** agent to assess code quality:

- Check for security vulnerabilities
- Verify code quality and maintainability
- Identify performance issues
- Ensure standards compliance with CLAUDE.md

### Phase 5: Iterate if Needed

- If tests fail: Analyze failures, fix code, re-test
- If review finds critical issues: Address them, re-test, re-review
- Maximum 3 iterations per phase

### Phase 6: Document (Use doc-writer agent, optional)

If documentation is needed, use the **doc-writer** agent to:

- Add inline comments (JSDoc/docstring) for key functions
- Create/update API documentation if new endpoints added
- Update README if project structure changed

### Phase 7: Complete

- Verify all requirements met
- Confirm all tests passing
- Provide completion summary to user

## Language Handling

Detect user's language from their requirement and respond in the same language:
- If Chinese (中文): Respond in Chinese
- If English: Respond in English

## Progress Reporting

Provide clear status updates to the user:

```
## Current Phase
[What you're doing now]

## Progress
- ✅ Completed
- 🔄 In progress
- ⏳ Pending

## Results
[Summary of current phase]

## Next Steps
[What happens next]
```

## Key Points

1. **You handle implementation directly** - Don't delegate core coding
2. **Use specialized agents for support** - Testing, review, documentation
3. **Iterate when needed** - Fix issues until quality standards met
4. **Follow CLAUDE.md** - Respect project-specific rules
5. **Keep user informed** - Clear progress updates in their language

Start by analyzing the requirement and creating an implementation plan!
