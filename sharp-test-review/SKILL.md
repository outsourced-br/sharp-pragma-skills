---
name: sharp-test-review
description: "Review .NET test strategy including scenario coverage, useful coverage, assertions, mocks, fixtures, flaky tests, integration boundaries, and test naming. Use for unit tests, integration tests, coverage quality, over-mocking, scenario-test gaps, and test suite maintainability."
---

# Test review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review test strategy, scenario coverage, useful coverage, mock quality, fixtures, and integration-test shape.

## When to use

- tests
- unit tests
- integration tests
- coverage
- mocks
- scenario tests

## Role in workflow

This is review lens step 13 in the full workflow. It may read upstream findings from `sharp-code-quality-review, sharp-allocation-review` and may hand off to `sharp-security-hygiene, sharp-code-review-reporting`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-code-quality-review, sharp-allocation-review`
- Hands off to: `sharp-security-hygiene, sharp-code-review-reporting`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/coverage-heuristics.md`
- `resources/mock-strategy-guide.md`
- `resources/test-naming-conventions.md`
- `resources/test-review-checklist.md`
- `resources/test-review-output-contract.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
