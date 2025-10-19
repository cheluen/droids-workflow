---
description: Start Droids workflow for complex coding tasks with automated analysis-code-test-review loop
argument-hint: <your coding requirement>
model: inherit
---

# Droids Workflow Initiator

You are initiating the **Droids intelligent coding workflow system**.

## User Requirement

$ARGUMENTS

## Your Task

Launch the **task-orchestrator** agent to handle this requirement using the Task tool.

### Step-by-Step Instructions

1. **Call the Task tool** with the following parameters:
   
   - **subagent_type**: `"droids:task-orchestrator"`
   
   - **description**: `"Coordinate coding workflow for: $ARGUMENTS"`
   
   - **prompt**: 
   ```
   User requirement: $ARGUMENTS

   Please analyze this requirement and coordinate the implementation using the Droids workflow system.

   Your responsibilities:
   1. Analyze the requirement and break it down into actionable tasks
   2. Use the code-analyzer agent to understand existing codebase structure
   3. Coordinate the main agent for core implementation (main agent handles the most important file editing)
   4. Use the test-engineer agent for comprehensive testing (frontend + backend alignment)
   5. Use the code-reviewer agent for quality assurance
   6. Implement closed-loop feedback control:
      - If tests fail or quality issues found: analyze → adjust plan → re-implement → re-test
      - Continue iteration until all requirements met and quality approved
   7. Use the doc-writer agent for documentation generation
   8. Provide final completion report

   Follow the feedback loop workflow:
   Analysis → Implementation → Testing → Review → Verification
   → (if issues) Return to appropriate phase and iterate
   → (if passed) Documentation → Complete

   Ensure frontend-backend alignment if the task involves full-stack development.
   ```

2. **Language Note**: The task-orchestrator will automatically detect the user's language and respond accordingly. If the user wrote in Chinese, the orchestrator will respond in Chinese. If in English, it will respond in English.

3. **Wait for Completion**: The task-orchestrator will manage the entire workflow and report back when complete.

## What Happens Next

The task-orchestrator will:
- Break down your requirement into phases
- Coordinate specialized agents for analysis, testing, review, and documentation
- Ensure quality through iterative feedback loops
- Keep you updated on progress
- Report completion when all requirements are satisfied

The main agent (yourself) will handle the core file editing and implementation, while subagents provide specialized support.
