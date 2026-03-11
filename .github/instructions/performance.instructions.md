---
applyTo: "**/*"
description: "Performance optimization guidelines for Jaspr web applications"
---

# Performance Guidelines

## Web Performance

- Optimize bundle size through code splitting and tree shaking
- Use lazy loading for components and routes not immediately needed
- Minimize HTTP requests and optimize asset loading
- Implement progressive loading strategies for large datasets
- Use efficient image formats and compression

## Dart Performance

- Use const constructors and immutable objects where possible
- Avoid creating unnecessary objects in hot code paths
- Use efficient data structures for specific use cases
- Profile memory usage and optimize garbage collection pressure
- Leverage Dart's null safety for performance optimizations

## Jaspr Optimization

- Optimize component rendering with proper key usage
- Use Jaspr's memoization features for expensive computations
- Implement efficient state management patterns
- Minimize unnecessary component re-renders
- Use streaming and async patterns for better user experience

## Network Optimization

- Implement request caching and response optimization
- Use compression for API responses and static assets
- Minimize API calls through batching and efficient queries
- Implement offline capabilities where appropriate
- Use CDN for static asset delivery when possible

## Rendering Performance

- Optimize critical rendering path for fast initial page loads
- Use efficient CSS and minimize layout thrashing
- Implement virtual scrolling for large lists
- Optimize animations and transitions for smooth performance
- Monitor and optimize Core Web Vitals metrics

## Monitoring and Measurement

- Use browser performance tools to identify bottlenecks
- Monitor bundle size and loading performance
- Profile runtime performance of critical user paths
- Set up performance budgets and monitoring alerts
- Regular performance audits and optimization cycles