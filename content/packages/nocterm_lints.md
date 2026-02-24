---
title: nocterm_lints
slug: nocterm_lints
date: 2026-02-24
tags:
  - lints
  - tooling
pubUrl: https://pub.dev/packages/nocterm_lints
repo: https://github.com/zoocityboy/nocterm_lints
summary: Opinionated lint rules for small, terminal-centric Dart projects and libraries.
layout: package_detail
type: package

---

nocterm_lints captures a set of lint rules and opinionated defaults that fit terminal-first projects, small packages, and CLI utilities. It remixes core Dart lints with practical preferences: strictness where it catches bugs, leniency where readability and ergonomics win for short-lived tools.

Why use nocterm_lints

- Consistency: Enforce a consistent coding style across small utilities and CLI tools.
- Safety: Enable rules that catch common mistakes in async code, null-safety usage, and resource handling.
- Productivity: Turn off or relax rules that tend to be noisy in tiny scripts (for example, overly strict widget naming that doesn't apply to a CLI).

### Quick setup

Add to your dev_dependencies and include it in analysis_options.yaml:

```yaml
dev_dependencies:
  nocterm_lints: ^1.0.0

analyzer:
  plugins:
    - nocterm_lints

include: package:nocterm_lints/analysis_options.yaml
```

### Tips

- Start with the recommended profile, then opt into stricter rules as your codebase grows.
- Use the lint rules as conversation starters — adjust them to match team preferences rather than treating them as absolute rules.
