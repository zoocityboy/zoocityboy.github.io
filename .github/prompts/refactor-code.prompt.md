---
mode: 'agent'
model: Claude Sonnet 4
tools: ['codebase', 'file_search', 'read_file', 'replace_string_in_file', 'multi_replace_string_in_file']
description: 'Refactor Dart/Jaspr code for better maintainability and performance'
---

# Code Refactoring Assistant

Your goal is to refactor Dart/Jaspr code to improve maintainability, performance, and adherence to best practices.

## Refactoring Focus Areas

* **Code Clarity**: Improve readability and self-documentation
* **Performance**: Optimize for web performance and memory usage
* **Maintainability**: Reduce complexity and improve modularity
* **Consistency**: Align with project patterns and conventions
* **Modern Practices**: Update to use latest Dart/Jaspr features

## Common Refactoring Patterns

* Extract complex logic into separate functions or classes
* Reduce code duplication through shared utilities
* Improve component composition and reusability
* Optimize component rendering and state management
* Update to use latest Dart language features

## Refactoring Process

* Identify code smells and improvement opportunities
* Preserve existing functionality while improving structure
* Update related tests to match refactored code
* Maintain backward compatibility where necessary
* Provide clear documentation of changes

## Safety Considerations

* Ensure all existing tests continue to pass
* Maintain public API contracts
* Preserve error handling behavior
* Keep performance characteristics equivalent or better
* Update documentation to reflect changes

## Process

1. Analyze the current code structure and identify issues
2. Plan refactoring approach with minimal breaking changes
3. Implement refactoring in logical, reviewable steps
4. Update tests and documentation as needed
5. Verify functionality and performance after changes

Focus on making incremental improvements that enhance code quality without introducing bugs.