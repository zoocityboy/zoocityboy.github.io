---
applyTo: "**/*.dart"
description: "Dart development best practices for Jaspr web applications"
---

# Dart Development Guidelines

## Language Standards

- Use Dart 3.0+ features including records, patterns, and switch expressions
- Enable and maintain null safety throughout the codebase
- Use strong typing - avoid `dynamic` except when necessary
- Prefer `final` over `var` for immutable variables
- Use `const` constructors and values where possible for performance

## Naming Conventions

- Classes and types: PascalCase (`MyComponent`, `UserModel`)
- Variables and functions: camelCase (`userName`, `buildWidget`)
- Constants: camelCase with `const` keyword (`const primaryColor`)
- Private members: leading underscore (`_internalMethod`)
- Files and folders: snake_case (`user_profile.dart`, `components/`)

## Code Structure

- Keep functions and methods focused and small (ideally under 20 lines)
- Use meaningful names that describe function purpose
- Group related functionality in classes or utility functions
- Separate business logic from UI components
- Use factories and named constructors for object creation patterns

## Jaspr-Specific Practices

- Leverage Jaspr's component system for reusable UI elements
- Use Jaspr's reactive patterns for state management
- Optimize component rendering with proper key usage
- Follow Jaspr's lifecycle methods and hooks correctly
- Use Jaspr's built-in utilities for common web development tasks

## Error Handling

- Use try-catch blocks for potential runtime errors
- Create custom exception classes for domain-specific errors
- Provide meaningful error messages for debugging
- Handle async operations with proper error propagation
- Use Result types or similar patterns for expected failures

## Performance Considerations

- Use lazy loading for large components or datasets
- Minimize object creation in hot paths
- Use const constructors to improve performance
- Profile memory usage in complex applications
- Optimize for web bundle size and loading times

## Testing Standards

- Write unit tests for business logic and utilities
- Use meaningful test descriptions and organize tests logically
- Mock external dependencies in tests
- Test edge cases and error conditions
- Maintain test coverage for critical functionality