# Droids - Intelligent Coding Workflow for Claude Code

> English Documentation | [中文文档](./README.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-purple)](https://docs.claude.com/en/docs/claude-code/plugins)
[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/cheluen/droids-workflow)

Droids is a comprehensive Claude Code plugin that provides a self-healing CI/CD workflow system. It coordinates specialized AI agents (backend-engineer, frontend-engineer, code-reviewer, test-engineer, doc-writer) to handle complex coding tasks with built-in quality assurance, iterating infinitely until perfect completion.

## 🌟 Features

- **🔄 Self-Healing CI/CD**: Coding → Review → Test → Supervise → Loop until perfect
- **🤖 5 Specialized Agents**: Backend engineer, frontend engineer, test engineer, code reviewer, doc writer
- **🧪 Comprehensive Testing**: Frontend + backend testing with alignment verification
- **🔒 Quality Assurance**: Automated code review with security, performance, and standards checks
- **📝 Multi-Language Documentation**: Generate Chinese or English docs directly from code
- **🎯 Intelligent Orchestration**: Main agent handles supervision and rule distribution
- **🌐 Global Rule Inheritance**: Automatically passes relevant ~/.claude/CLAUDE.md rules to subagents
- **⚡ Model Optimization**: Selects models by task complexity, balancing cost and quality

## 📦 Installation

### Manual Installation

```bash
# 1. Clone the repository
git clone https://github.com/cheluen/droids-workflow.git

# 2. Copy to Claude Code plugins directory
# Project-level (current project only)
mkdir -p .claude/plugins/droids
cp -r droids-workflow/* .claude/plugins/droids/

# Or user-level (globally available)
mkdir -p ~/.claude/plugins/droids
cp -r droids-workflow/* ~/.claude/plugins/droids/
```

## 🚀 Quick Start

### Start a Coding Workflow

Use `/droids:start` to initiate the intelligent workflow:

```bash
# Implement a new feature
/droids:start Implement user authentication with JWT tokens

# Full-stack development
/droids:start Implement user login with frontend and backend

# Fast test mode (uses faster model)
/droids:start Quick test the user registration feature
```

### Generate Documentation

```bash
# Generate Chinese documentation
/droids:cndoc

# Generate English documentation
/droids:endoc

# Document specific module
/droids:cndoc src/api/user
```

## 🤖 The Droids Team

### Main Agent (Orchestrator + Supervisor) 🎯

**Role**: Core coordinator, rule distributor, quality supervisor

- Reads and understands global CLAUDE.md, extracts relevant rules for subagents
- Analyzes requirements, determines backend/frontend/fullstack scope
- Orchestrates subagent call sequence
- Performs supervision duties, ensures requirement alignment
- Decides whether to continue iterating or complete

### 1. Backend Engineer 💻
**Model**: inherit (inherits from caller)

- Implements APIs, database operations, business logic
- Handles authentication, authorization, data validation
- Integrates third-party services

**Use case**: Backend development tasks

### 2. Frontend Engineer 🎨
**Model**: sonnet

- Implements UI components, user interactions, state management
- Integrates with backend APIs
- Ensures responsiveness and accessibility

**Use case**: Frontend development tasks

### 3. Code Reviewer 👁️
**Model**: inherit (inherits from caller)

- Reviews code quality and maintainability
- Identifies security vulnerabilities (OWASP Top 10)
- Checks performance issues
- Ensures coding standards compliance

**Use case**: Code review, security audits

### 4. Test Engineer 🧪
**Model**: sonnet (default) / haiku (fast mode)

- Writes unit, integration, and E2E tests
- Tests both frontend and backend
- Runs tests and reports coverage

**Use case**: Adding test coverage, verifying functionality

### 5. Doc Writer 📝
**Model**: haiku

- Generates inline code comments (JSDoc, docstrings)
- Creates API documentation
- Writes README and usage guides
- Supports Chinese and English

**Use case**: Creating or updating documentation

## 🔄 Self-Healing CI/CD Workflow

```
User Request (/droids:start)
     ↓
Main Agent reads global CLAUDE.md, extracts rules
     ↓
Main Agent analyzes requirements, plans tasks
     ↓
┌─────────────────────────────────────────────┐
│              Iteration Loop                  │
│                                             │
│  [Coding] Backend Engineer → Frontend Eng   │
│       ↓ (strict sequential, backend first)  │
│  [Review] Code Reviewer                     │
│       ↓                                     │
│  [Test] Test Engineer                       │
│       ↓                                     │
│  [Supervise] Main Agent evaluates results   │
│       ↓                                     │
│  Pass? ─── Yes ──→ Exit Loop                │
│    │                                        │
│   No                                        │
│    └──→ Fix issues → Continue Loop          │
│                                             │
└─────────────────────────────────────────────┘
     ↓
[Optional] Doc Writer generates documentation
     ↓
Task Complete
```

## 💡 Example Workflows

### Example 1: Full-Stack Feature Development

```bash
> /droids:start Implement user login with frontend and backend

# Workflow:
# 1. Main Agent reads global rules, analyzes requirements
# 2. Backend Engineer implements JWT authentication API
# 3. Frontend Engineer implements login form (waits for backend)
# 4. Code Reviewer checks security
# 5. Test Engineer writes frontend and backend tests
# 6. Main Agent supervises: checks requirement alignment, test results
# 7. If issues: fix → re-review → re-test
# 8. All passed → complete
```

### Example 2: Fast Test Mode

```bash
> /droids:start Quick test the payment module

# Main Agent detects "quick" keyword
# Calls test-engineer with haiku model
# Faster test completion, lower cost
```

### Example 3: Direct Agent Invocation

```bash
# Call backend engineer directly
> Use backend-engineer to implement Redis caching layer

# Call frontend engineer directly
> Use frontend-engineer to refactor the user dashboard component

# Call test engineer directly
> Use test-engineer to add tests for the auth module
```

## 🎯 Key Benefits

### 1. Self-Healing CI/CD
- Coding → Review → Test → Supervise closed loop
- Automatically fixes issues and re-validates
- Infinite iteration until perfect completion

### 2. Intelligent Rule Distribution
- Main Agent reads global ~/.claude/CLAUDE.md
- Semantic understanding, extracts relevant rules by role
- Each subagent receives only relevant rules, avoiding context pollution

### 3. Strict Order Constraints
- Backend must complete before frontend
- Avoids frontend-backend race conditions
- Ensures API contracts before UI implementation

### 4. Model Cost Optimization
| Agent | Model | Reason |
|-------|-------|--------|
| backend-engineer | inherit | Inherits from caller, flexible control |
| frontend-engineer | sonnet | Needs to understand UI logic |
| code-reviewer | inherit | Inherits from caller |
| test-engineer | sonnet/haiku | Default sonnet, supports fast mode |
| doc-writer | haiku | Documentation tasks are simple, saves cost |

### 5. Isolation Design
- Plugin only activates on `/droids:*` commands
- Skills marked as `[DROIDS-INTERNAL]`, won't pollute normal sessions
- Subagents can be invoked independently or through workflow orchestration

## 📋 CLAUDE.md Integration

Main Agent automatically reads and understands your global and project CLAUDE.md files, distributing relevant rules to corresponding subagents:

```markdown
# Example ~/.claude/CLAUDE.md

## Testing Related
- Test environment must match production deployment platform
- Frontend must be tested with chrome-devtool

## Code Review Related
- No pseudo-code or placeholders allowed
- Must review code to ensure quality

## General Rules
- Internal agent communication in English
- User-facing information in Chinese
```

Main Agent will:
- Pass testing rules to test-engineer
- Pass review rules to code-reviewer
- Pass general rules to all agents

## 🔧 Advanced Usage

### Fast Test Mode

Include "quick", "fast" keywords in your request:

```bash
/droids:start Quick verify login functionality
```

test-engineer will use haiku model for faster completion.

### Direct Agent Access

```bash
# Backend development
> Use backend-engineer to implement payment API

# Frontend development
> Use frontend-engineer to implement shopping cart component

# Code review
> Use code-reviewer to review recent PR

# Testing
> Use test-engineer to add tests for user module

# Documentation
> Use doc-writer to generate API documentation
```

## 📊 Workflow Monitoring

Main Agent uses TodoWrite to track progress:

```
✅ Requirements analysis complete
✅ Backend implementation complete
✅ Frontend implementation complete
🔄 Code review in progress
⏳ Testing pending
⏳ Supervision evaluation pending
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

```bash
# Clone the repository
git clone https://github.com/cheluen/droids-workflow.git

# Test locally
cp -r droids-workflow ~/.claude/plugins/droids
```

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

## 🔗 Links

- [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code/overview)
- [Plugin Development Guide](https://docs.claude.com/en/docs/claude-code/plugins)
- [GitHub Repository](https://github.com/cheluen/droids-workflow)

## 💬 Support

- **Issues**: Report bugs or request features on [GitHub Issues](https://github.com/cheluen/droids-workflow/issues)
- **Discussions**: Join conversations on [GitHub Discussions](https://github.com/cheluen/droids-workflow/discussions)

---

**Made with 🤖 by Droids Team - v2.0.0**
