---
name: droids-security-checklist
description: Security review checklist for code analysis. Use when reviewing code for security vulnerabilities, authentication issues, input validation, or OWASP top 10 concerns.
---

# Security Review Checklist

Use this checklist when performing security reviews of code changes.

## Authentication & Authorization

- [ ] All endpoints require appropriate authentication
- [ ] Authorization checks are present and correct
- [ ] Session management is secure (timeout, regeneration)
- [ ] Password policies are enforced
- [ ] Multi-factor authentication where appropriate

## Input Validation

- [ ] All user inputs are validated server-side
- [ ] Input length limits are enforced
- [ ] Special characters are properly escaped
- [ ] File uploads are validated (type, size, content)
- [ ] URL parameters are validated

## Injection Prevention

- [ ] SQL queries use parameterized statements
- [ ] NoSQL queries are properly sanitized
- [ ] Command injection is prevented
- [ ] LDAP injection is prevented
- [ ] XPath injection is prevented

## XSS Prevention

- [ ] Output encoding is applied consistently
- [ ] Content Security Policy headers are set
- [ ] DOM-based XSS is prevented
- [ ] Stored XSS is prevented
- [ ] Reflected XSS is prevented

## CSRF Protection

- [ ] CSRF tokens are used for state-changing operations
- [ ] SameSite cookie attribute is set
- [ ] Referer/Origin headers are validated

## Sensitive Data

- [ ] No hardcoded secrets, API keys, or passwords
- [ ] Sensitive data is encrypted at rest
- [ ] Sensitive data is encrypted in transit (HTTPS)
- [ ] PII is handled according to regulations
- [ ] Logs don't contain sensitive information

## Error Handling

- [ ] Error messages don't expose system details
- [ ] Stack traces are not shown to users
- [ ] Errors are logged appropriately
- [ ] Fail-secure defaults are used

## Dependencies

- [ ] Dependencies are up to date
- [ ] No known vulnerabilities in dependencies
- [ ] Minimal dependency footprint

## Severity Levels

When reporting issues, use these severity levels:

| Level | Description | Example |
|-------|-------------|---------|
| CRITICAL | Immediate exploitation risk | SQL injection, RCE |
| HIGH | Significant security impact | Auth bypass, XSS |
| MEDIUM | Moderate risk with conditions | CSRF, info disclosure |
| LOW | Minor security concern | Missing headers |
