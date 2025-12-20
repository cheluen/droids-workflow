---
name: droids-code-quality
description: Code quality standards and review guidelines. Use when reviewing code for maintainability, readability, performance, and adherence to best practices.
---

# Code Quality Standards

Use these guidelines when reviewing code quality.

## Code Readability

### Naming Conventions
- Variables: descriptive, camelCase (`userEmail`, `isActive`)
- Functions: verb + noun, describe action (`getUserById`, `validateInput`)
- Classes: PascalCase, noun (`UserService`, `PaymentProcessor`)
- Constants: UPPER_SNAKE_CASE (`MAX_RETRY_COUNT`, `API_BASE_URL`)

### Function Guidelines
- Single responsibility (do one thing well)
- Maximum 20-30 lines per function
- Maximum 3-4 parameters
- Early returns for guard clauses
- Avoid deep nesting (max 3 levels)

### Code Smells to Avoid
- [ ] Long methods (> 50 lines)
- [ ] Large classes (> 300 lines)
- [ ] Deep nesting (> 3 levels)
- [ ] Duplicate code
- [ ] Magic numbers/strings
- [ ] Dead code
- [ ] Commented-out code
- [ ] God objects/classes

## Performance Considerations

### Database
- [ ] No N+1 query problems
- [ ] Proper indexing for queries
- [ ] Pagination for large datasets
- [ ] Connection pooling used

### Memory
- [ ] No memory leaks
- [ ] Large objects cleaned up
- [ ] Streams used for large data
- [ ] Caching implemented where appropriate

### Algorithm
- [ ] Appropriate time complexity
- [ ] Efficient data structures
- [ ] No unnecessary iterations
- [ ] Lazy evaluation where beneficial

## Error Handling

### Best Practices
```javascript
// Good: Specific error handling
try {
  await saveUser(user);
} catch (error) {
  if (error instanceof ValidationError) {
    return res.status(400).json({ error: error.message });
  }
  if (error instanceof DatabaseError) {
    logger.error('Database error:', error);
    return res.status(500).json({ error: 'Internal error' });
  }
  throw error; // Re-throw unknown errors
}
```

### Error Handling Checklist
- [ ] All async operations have error handling
- [ ] Errors are logged with context
- [ ] User-facing errors are user-friendly
- [ ] System errors don't leak sensitive info
- [ ] Resources are cleaned up on error

## Code Organization

### File Structure
```
src/
├── components/     # UI components
├── services/       # Business logic
├── utils/          # Helper functions
├── types/          # Type definitions
├── constants/      # Constants and config
└── tests/          # Test files
```

### Module Guidelines
- One concept per file
- Related code grouped together
- Clear import/export boundaries
- Avoid circular dependencies

## SOLID Principles

| Principle | Description |
|-----------|-------------|
| **S**ingle Responsibility | One reason to change |
| **O**pen/Closed | Open for extension, closed for modification |
| **L**iskov Substitution | Subtypes must be substitutable |
| **I**nterface Segregation | Many specific interfaces |
| **D**ependency Inversion | Depend on abstractions |

## Review Severity Levels

| Level | Description | Action |
|-------|-------------|--------|
| BLOCKER | Prevents merge | Must fix |
| MAJOR | Significant issue | Should fix |
| MINOR | Improvement | Consider fixing |
| SUGGESTION | Nice to have | Optional |

## Quick Quality Checklist

- [ ] Code is readable without comments
- [ ] Functions are small and focused
- [ ] No code duplication
- [ ] Proper error handling
- [ ] No performance issues
- [ ] Follows project conventions
- [ ] No security vulnerabilities
- [ ] Tests are included
