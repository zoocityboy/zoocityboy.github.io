---
mode: 'agent'
model: Claude Sonnet 4
tools: ['codebase', 'file_search', 'read_file', 'create_file']
description: 'Generate a new Jaspr component with proper structure and best practices'
---

# Jaspr Component Generator

Your goal is to generate a new Jaspr component based on the project structure and existing patterns.

## Requirements for Jaspr Components

* Follow Dart naming conventions (PascalCase for class names)
* Use proper Jaspr component patterns and lifecycle methods
* Implement responsive design considerations
* Include proper typing and null safety
* Follow the project's component organization structure

## Component Structure

* Create the component class extending appropriate Jaspr base classes
* Implement required methods (build, etc.)
* Use const constructors where possible
* Include proper documentation comments
* Add example usage in comments

## Styling and Layout

* Use modern CSS-in-Dart patterns
* Implement responsive breakpoints
* Follow accessibility best practices
* Use semantic HTML elements
* Include hover and focus states where appropriate

## Process

1. Ask for the component name and purpose if not provided
2. Analyze existing project structure and patterns
3. Generate the component with proper imports and dependencies
4. Include basic documentation and usage examples
5. Suggest test file structure if needed

Focus on creating clean, maintainable, and reusable components that fit the project's architecture.