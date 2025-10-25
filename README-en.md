# Droids - Intelligent Coding Workflow for Claude Code

> English Documentation | [中文文档](./README.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-purple)](https://docs.claude.com/en/docs/claude-code/plugins)

Droids is a comprehensive Claude Code plugin that provides an intelligent coding workflow system with automated analysis-code-test-review feedback loops. It coordinates specialized AI agents to handle complex coding tasks with built-in quality assurance.

## 🌟 Features

- **🔄 Closed-Loop Feedback Control**: Automatic iteration until requirements are met and quality is approved
- **🤖 3 Specialized Agents**: Test engineer, code reviewer, and documentation writer
- **🧪 Comprehensive Testing**: Frontend + backend testing with alignment verification
- **🔒 Quality Assurance**: Automated code review with security, performance, and standards checks
- **📝 Multi-Language Documentation**: Generate Chinese or English docs directly from code
- **🎯 Lightweight Design**: Main agent directly coordinates workflow, reducing memory usage
- **🌐 Multilingual Support**: Responds in user's language (Chinese/English)
- **⚡ High Performance**: Optimized architecture prevents memory issues

## 📦 Installation

### Option 1: From Plugin Marketplace (Recommended)

```bash
# Run in Claude Code
/plugin marketplace add cheluen/droids-workflow
/plugin install droids
```

### Option 2: Manual Installation

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

# Add functionality to existing code
/droids:start Add rate limiting to all API endpoints with Redis backend

# Refactor with quality assurance
/droids:start Refactor the payment module for better performance
```

### Generate Documentation

#### Generate Chinese Documentation

```bash
# Document entire project in Chinese
/droids:cndoc

# Document specific module
/droids:cndoc src/api/user
```

#### Generate English Documentation

```bash
# Document entire project in English
/droids:endoc

# Document specific file
/droids:endoc src/services/auth.ts
```

## 🤖 The Droids Team

### Main Agent (You) 🎯
**Role**: Core coordinator and implementer

- Analyzes requirements and creates execution plans
- Implements core functionality directly
- Coordinates specialized agents for support
- Validates quality and iterates until requirements met
- Tracks progress with TodoWrite

**Benefit**: Reduces agent nesting, lowers memory usage

### 1. Test Engineer 🧪
**Role**: Comprehensive testing specialist

- Writes unit, integration, and E2E tests
- Tests both frontend and backend
- Verifies frontend-backend alignment
- Runs tests and reports coverage

**When to use**: Adding test coverage, verifying functionality

### 2. Code Reviewer 👁️
**Role**: Quality assurance and security expert

- Reviews code quality and maintainability
- Identifies security vulnerabilities
- Checks performance issues
- Ensures coding standards compliance

**When to use**: Pre-merge reviews, security audits, quality checks

### 3. Doc Writer 📝
**Role**: Documentation generation specialist

- Generates inline code comments (JSDoc, docstrings)
- Creates API documentation
- Writes README and usage guides
- Supports Chinese and English

**When to use**: Creating or updating documentation

## 🔄 Workflow Architecture (Optimized)

```
User Request
     ↓
Main Agent Directly Coordinates Workflow
     ↓
[Step 1] Main Agent analyzes requirements
     ↓
[Step 2] Main Agent implements core functionality
     ↓
[Step 3] Test Engineer → Write & run tests
     ↓
[Step 4] Code Reviewer → Review quality
     ↓
Verification → Tests pass? Quality approved?
     ↓
[NO] → Main Agent fixes issues → Re-test/review
     ↓
[YES] → [Step 5] Doc Writer → Generate docs (optional)
     ↓
Task Complete

Benefits:
✅ Reduced agent nesting (no task-orchestrator needed)
✅ Lower memory usage (3 agents instead of 5)
✅ More direct workflow (main agent coordinates)
✅ Maintains core functionality
```

## 💡 Example Workflows

### Example 1: Implement New Feature

```bash
> /droids:start Add OAuth2 authentication with Google and GitHub

# What happens:
# 1. Main Agent analyzes requirement and studies existing auth system
# 2. Main Agent implements OAuth2 integration directly
# 3. Test Engineer writes auth tests
# 4. Code Reviewer checks security
# 5. If issues found: Main Agent fixes and re-tests
# 6. Doc Writer generates auth documentation (optional)
# 7. Complete with quality assurance
```

### Example 2: Refactor with Testing

```bash
> /droids:start Refactor database queries to use connection pooling

# What happens:
# 1. Main Agent identifies all database queries
# 2. Main Agent refactors to use pooling
# 3. Test Engineer writes/updates database tests
# 4. Code Reviewer checks for performance improvements
# 5. Main Agent fixes if tests fail
# 6. Doc Writer documents new database architecture
```

### Example 3: Generate Fresh Documentation

```bash
> /droids:cndoc

# What happens:
# 1. Main Agent scans entire codebase
# 2. Doc Writer reads code directly (ignores old docs)
# 3. Generates accurate Chinese documentation
# 4. Creates README-zh.md, API-REFERENCE-zh.md
# 5. Adds inline Chinese comments
```

## 🎯 Key Benefits

### 1. Quality Assurance
- Multiple review stages ensure high code quality
- Automated testing catches bugs early
- Security vulnerabilities identified
- Performance issues detected

### 2. Closed-Loop Feedback
- Automatic iteration when issues found
- No manual back-and-forth needed
- Continues until all requirements met
- Prevents incomplete implementations

### 3. Frontend-Backend Alignment
- Contract testing ensures API compatibility
- Data shape validation
- Error handling consistency
- State synchronization verification

### 4. Accurate Documentation
- Generated from actual code, not outdated docs
- Supports Chinese and English
- Keeps documentation in sync with implementation
- Reduces documentation debt

### 5. CLAUDE.md Integration
- All agents respect project-specific rules
- Follows coding standards automatically
- Uses project's testing frameworks
- Maintains consistency with team conventions

## 📋 CLAUDE.md Integration

All Droids agents automatically read and follow your project's `CLAUDE.md` files:

```markdown
# Example CLAUDE.md that Droids will respect

## Tech Stack
- TypeScript, React, Node.js, PostgreSQL

## Coding Standards
- Use functional components
- TypeScript strict mode
- No `any` types
- Comprehensive error handling

## Testing Requirements
- Minimum 80% coverage
- Use Jest and React Testing Library
- E2E tests for critical flows

## Documentation
- JSDoc for all public functions
- API documentation in OpenAPI format
```

## 🛠️ Configuration

Droids works out of the box with no configuration needed. However, you can customize behavior through your project's `CLAUDE.md`:

### Customize Testing
```markdown
# CLAUDE.md
## Testing Framework
- Backend: Jest + Supertest
- Frontend: Vitest + Testing Library
- E2E: Playwright
```

### Customize Code Review
```markdown
# CLAUDE.md
## Code Review Standards
- Security: OWASP Top 10 compliance
- Performance: No N+1 queries
- Quality: Cyclomatic complexity < 10
```

### Customize Documentation
```markdown
# CLAUDE.md
## Documentation Standards
- API docs in OpenAPI 3.0 format
- Inline comments in Chinese
- README in both English and Chinese
```

## 🔧 Advanced Usage

### Direct Agent Access

You can also call agents directly for specific tasks:

```bash
# Just write tests
> Use the test-engineer agent to add tests for the user service

# Just review code
> Use the code-reviewer agent to review this PR for security issues

# Just generate docs
> Use the doc-writer agent to document the API endpoints
```

### Combining with Other Tools

Droids works seamlessly with:
- MCP servers (database, APIs, etc.)
- Custom slash commands
- Other Claude Code plugins
- CI/CD workflows

## 📊 Workflow Monitoring

The Task Orchestrator uses TodoWrite to track progress:

```
✅ Analysis complete
🔄 Implementation in progress
⏳ Testing pending
⏳ Review pending
⏳ Documentation pending
```

You can monitor the workflow in real-time as agents coordinate and complete their tasks.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

```bash
# Clone the repository
git clone https://github.com/cheluen/droids-workflow.git

# Test locally
# Copy to ~/.claude/plugins/droids/ for testing
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

## 🎉 Acknowledgments

Built with ❤️ for the Claude Code community.

Special thanks to:
- Anthropic for Claude Code
- The open-source community
- Early adopters and contributors

---

**Made with 🤖 by Droids Team**
