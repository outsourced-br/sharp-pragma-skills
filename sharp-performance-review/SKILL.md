---
name: sharp-performance-review
description: "Review measurable runtime performance risks and produce profiling or benchmark plans when evidence is missing. Use for throughput, latency, slow paths, EF query shape, synchronous blocking, materialization, caching proposals, and performance false-positive resistance."
---

# Performance review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review measurable runtime performance risks and produce profiling or benchmark plans when evidence is missing.

## When to use

- performance
- throughput
- latency
- slow path
- profiling

## Role in workflow

This is review lens step 11 in the full workflow. It may read upstream findings from `sharp-composition-over-inheritance, sharp-analyzer-policy-review, sharp-nuget-dependency-review` and may hand off to `sharp-allocation-review, sharp-test-review`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-composition-over-inheritance, sharp-analyzer-policy-review, sharp-nuget-dependency-review`
- Hands off to: `sharp-allocation-review, sharp-test-review`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/ef-io-performance-guide.md`
- `resources/performance-output-contract.md`
- `resources/performance-review-checklist.md`
- `resources/profiling-and-diagnostics-guide.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
