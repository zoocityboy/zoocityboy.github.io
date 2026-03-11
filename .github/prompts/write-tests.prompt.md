---
mode: 'agent'
model: Claude Sonnet 4
tools: ['codebase', 'file_search', 'read_file', 'create_file']
description: 'Generate comprehensive tests for Dart/Jaspr components and functions'
---

# Test Generator for Jaspr Applications

Your goal is to generate comprehensive test suites for Dart functions, classes, or Jaspr components.

## Test Requirements

* Use Dart's built-in test package and conventions
* Follow the Arrange-Act-Assert pattern
* Use descriptive test names that explain expected behavior
* Include both positive and negative test cases
* Test edge cases and error conditions

## Test Structure

* Create test files with `_test.dart` suffix
* Mirror the source file structure in the test directory
* Use `group()` to organize related tests
* Include `setUp()` and `tearDown()` when needed
* Use appropriate matchers and assertions

## Component Testing (Jaspr)

* Test component rendering and props
* Verify user interaction behavior
* Test state changes and lifecycle methods
* Mock external dependencies and services
* Test responsive behavior when applicable

## Unit Testing

* Test all public methods and functions
* Use mocks for external dependencies
* Test return values and side effects
* Verify exception handling
* Include performance considerations for critical paths

## Process

1. Analyze the source code structure and functionality
2. Identify key behaviors and edge cases to test
3. Generate test setup with proper imports and mocks
4. Create comprehensive test cases covering all scenarios
5. Include documentation explaining test purpose

Focus on creating maintainable tests that provide confidence in code correctness.