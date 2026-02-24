---
applyTo: "**/*"
description: "Security best practices for web applications"
---

# Security Guidelines

## Data Protection

- Never commit sensitive data, API keys, or credentials to version control
- Use environment variables for configuration and secrets
- Implement proper input validation and sanitization
- Avoid storing sensitive data in browser local storage
- Use HTTPS for all external API communications

## Web Security

- Implement Content Security Policy (CSP) headers
- Validate and sanitize user inputs to prevent XSS attacks
- Use secure authentication patterns and session management
- Implement proper CORS policies for API access
- Keep dependencies updated to address security vulnerabilities

## Client-Side Security

- Minimize exposure of internal application structure
- Use code obfuscation for sensitive business logic
- Implement proper error handling that doesn't leak system information
- Validate data received from external sources
- Use secure communication protocols for all network requests

## GitHub Pages Security

- Use secure deployment practices for static site generation
- Implement security headers through GitHub Pages or CloudFlare
- Monitor for unauthorized changes to repository settings
- Use branch protection rules for critical branches
- Regularly audit repository access and permissions

## Dependency Management

- Regularly update Dart SDK and package dependencies
- Use `pub audit` to identify known security vulnerabilities
- Review third-party packages before adding to dependencies
- Monitor for deprecated or unmaintained packages
- Use lock files to ensure consistent dependency versions

## Code Security

- Follow secure coding practices and avoid common vulnerabilities
- Use static analysis tools to identify potential security issues
- Implement proper access controls and authorization checks
- Log security events for monitoring and debugging
- Regular security reviews of critical functionality