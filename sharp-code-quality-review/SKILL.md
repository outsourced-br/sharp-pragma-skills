---
name: sharp-code-quality-review
description: "Review code quality and maintainability including naming, cohesion, nullability, async/resource management, exceptions, logging, ownership, and overly clever code. Use for clean-code reviews, maintainability concerns, resource lifetime issues, blocking async code, and readability findings."
---

# Code quality review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review maintainability, naming, cohesion, nullability, async/resource management, exceptions, logging, and overly clever code.

## When to use

- clean code
- code quality
- naming
- exceptions
- async
- logging
- nullability

## Role in workflow

This is review lens step 7 in the full workflow. It may read upstream findings from `sharp-architecture-pragmatic, sharp-analyzer-policy-review` and may hand off to `sharp-design-principles-review, sharp-test-review`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-architecture-pragmatic, sharp-analyzer-policy-review`
- Hands off to: `sharp-design-principles-review, sharp-test-review`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/async-resource-management-guide.md`
- `resources/code-quality-checklist.md`
- `resources/code-quality-output-contract.md`
- `resources/exception-logging-nullability-guide.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
