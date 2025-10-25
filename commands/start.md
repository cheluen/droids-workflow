---
description: Start intelligent coding workflow with automated testing and code review
argument-hint: <your coding requirement>
model: inherit
---

# Droids Coding Workflow

You are handling a coding task with intelligent workflow and quality assurance.

## User Requirement

$ARGUMENTS

## Your Task - Direct Workflow Coordination

**You (the main agent) will directly coordinate this workflow. Do NOT launch task-orchestrator or code-analyzer agents.**

### Workflow Steps

#### Phase 1: Analyze & Plan (You do this directly)
1. Read CLAUDE.md for project standards
2. Analyze the codebase structure relevant to the requirement
3. Create a clear implementation plan
4. Use TodoWrite to track your plan

#### Phase 2: Implement (You do this)
1. Implement the core functionality
2. Make necessary file changes
3. Follow coding standards from CLAUDE.md
4. Handle edge cases and errors

#### Phase 3: Test (Use test-engineer agent)
After implementation, launch the test-engineer agent:

```
Task tool parameters:
- subagent_type: "droids:test-engineer"
- description: "Write and run comprehensive tests for: [feature name]"
- prompt: "Write comprehensive tests for the implemented feature: $ARGUMENTS

Include:
- Backend tests (if applicable): unit tests, API tests
- Frontend tests (if applicable): component tests, E2E tests
- Contract tests: verify frontend-backend alignment
- Run tests and report results with coverage

Follow project testing standards from CLAUDE.md."
```

#### Phase 4: Review (Use code-reviewer agent)
After tests pass, launch the code-reviewer agent:

```
Task tool parameters:
- subagent_type: "droids:code-reviewer"
- description: "Review code quality and security for: [feature name]"
- prompt: "Review the implemented code for: $ARGUMENTS

Check:
- Security vulnerabilities
- Code quality and maintainability
- Performance issues
- Standards compliance with CLAUDE.md

Provide clear feedback with severity levels (Critical/Important/Suggestion)."
```

#### Phase 5: Iterate if Needed
- If tests fail: Analyze failures, fix code, re-test
- If review finds critical issues: Address them, re-test, re-review
- Maximum 3 iterations per phase

#### Phase 6: Document (Use doc-writer agent, optional)
If documentation is needed:

```
Task tool parameters:
- subagent_type: "droids:doc-writer"
- description: "Generate documentation for: [feature name]"
- prompt: "Generate documentation for the implemented feature: $ARGUMENTS

Create:
- Inline comments (JSDoc/docstring) for key functions
- API documentation if new endpoints added
- Update README if needed

Read code directly to ensure accuracy. Use [Chinese/English] based on user's language."
```

#### Phase 7: Complete
- Verify all requirements met
- Confirm tests passing
- Report completion to user

## Language Handling

**Detect user's language from their requirement:**
- If Chinese (中文): Respond in Chinese
- If English: Respond in English

## Output Format

Provide clear status updates in user's language:

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

1. **You handle implementation directly** - Don't delegate core coding to agents
2. **Agents provide specialized support** - Testing, review, documentation
3. **Iterate when needed** - Fix issues until quality standards met
4. **Follow CLAUDE.md** - Respect project-specific rules
5. **Keep user informed** - Clear progress updates in their language

Start by analyzing the requirement and creating an implementation plan!
