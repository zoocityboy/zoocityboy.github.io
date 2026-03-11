---
applyTo: "**/test/**/*.dart,**/*_test.dart"
description: "Testing standards and practices for Dart/Jaspr applications"
---

# Testing Guidelines

## Test Structure

- Organize tests in a `test/` directory mirroring the `lib/` structure
- Use descriptive test file names ending with `_test.dart`
- Group related tests using `group()` blocks
- Use clear, descriptive test descriptions that explain the expected behavior
- Follow the Arrange-Act-Assert pattern in test cases

## Unit Testing

- Test public methods and functions thoroughly
- Mock external dependencies using `mockito` or similar
- Test both happy paths and edge cases
- Verify error conditions and exception handling
- Use `setUp()` and `tearDown()` for test preparation and cleanup

## Widget Testing (Jaspr)

- Test component rendering and user interactions
- Verify component state changes and lifecycle
- Test responsive behavior across different screen sizes
- Mock external services and API calls in widget tests
- Use Jaspr-specific testing utilities and matchers

## Integration Testing

- Test complete user workflows and scenarios
- Verify data flow between components and services
- Test API integrations and external service interactions
- Use test databases or mock services for external dependencies
- Automate critical user paths

## Test Maintenance

- Keep tests simple and focused on single behaviors
- Update tests when refactoring or adding features
- Remove obsolete tests when functionality changes
- Maintain test data and fixtures separately
- Use test utilities to reduce duplication

## Performance Testing

- Profile and benchmark performance-critical functions
- Test memory usage and garbage collection impact
- Verify web bundle size and loading performance
- Test with realistic data sizes and user loads
- Monitor rendering performance and responsiveness