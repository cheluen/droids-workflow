---
name: droids-test-patterns
description: Testing patterns and best practices for writing comprehensive tests. Use when creating unit tests, integration tests, E2E tests, or improving test coverage.
---

# Testing Patterns & Best Practices

Use these patterns when writing tests for code changes.

## Test Structure (AAA Pattern)

```javascript
describe('Feature', () => {
  it('should do something specific', () => {
    // Arrange - Set up test data and conditions
    const input = createTestInput();

    // Act - Execute the code under test
    const result = functionUnderTest(input);

    // Assert - Verify the expected outcome
    expect(result).toBe(expectedValue);
  });
});
```

## Test Categories

### Unit Tests
- Test individual functions/methods in isolation
- Mock external dependencies
- Fast execution (< 100ms per test)
- High coverage of edge cases

### Integration Tests
- Test component interactions
- Use real dependencies where practical
- Test API endpoints end-to-end
- Verify database operations

### E2E Tests
- Test complete user workflows
- Run in browser environment
- Cover critical user journeys
- Slower but high confidence

## Test Naming Convention

```
[Unit/Feature] should [expected behavior] when [condition]
```

Examples:
- `UserService should throw error when email is invalid`
- `LoginForm should display error message when credentials are wrong`
- `API should return 401 when token is expired`

## Coverage Requirements

| Type | Minimum Coverage |
|------|------------------|
| Unit Tests | 80% line coverage |
| Integration Tests | Critical paths covered |
| E2E Tests | Main user journeys |

## Common Test Patterns

### Testing Async Code
```javascript
it('should handle async operations', async () => {
  const result = await asyncFunction();
  expect(result).toBeDefined();
});
```

### Testing Error Cases
```javascript
it('should throw on invalid input', () => {
  expect(() => functionUnderTest(null)).toThrow('Invalid input');
});
```

### Testing API Endpoints
```javascript
it('should return user data', async () => {
  const response = await request(app)
    .get('/api/users/1')
    .expect(200);

  expect(response.body).toHaveProperty('id', 1);
});
```

### Mocking Dependencies
```javascript
jest.mock('./database');
const mockDb = require('./database');
mockDb.query.mockResolvedValue([{ id: 1 }]);
```

## Test Quality Checklist

- [ ] Tests are deterministic (no flakiness)
- [ ] Tests are isolated (no shared state)
- [ ] Tests are fast (< 1s for unit tests)
- [ ] Tests have clear assertions
- [ ] Tests cover edge cases
- [ ] Tests cover error scenarios
- [ ] Tests use meaningful names
- [ ] Tests don't test implementation details

## Framework-Specific Patterns

### React Testing Library
```javascript
import { render, screen, fireEvent } from '@testing-library/react';

test('submits form with user data', async () => {
  render(<LoginForm />);

  fireEvent.change(screen.getByLabelText('Email'), {
    target: { value: 'test@example.com' }
  });
  fireEvent.click(screen.getByRole('button', { name: 'Submit' }));

  await screen.findByText('Success');
});
```

### Python pytest
```python
import pytest

def test_function_returns_expected():
    result = my_function(input_data)
    assert result == expected_output

@pytest.mark.parametrize("input,expected", [
    (1, 2),
    (2, 4),
    (3, 6),
])
def test_multiply_by_two(input, expected):
    assert multiply_by_two(input) == expected
```
