---
name: sharp-allocation-review
description: "Review allocation hotspots with hot-path evidence, profiler data, BenchmarkDotNet validation, and no-tool fallback plans before recommending allocation-free rewrites. Use for GC pressure, Span, ArrayPool, ValueTask, pooling, parsers, and allocation-free performance work."
---

# Allocation review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review allocation hotspots using performance evidence and BenchmarkDotNet-backed validation before allocation-free rewrites.

## When to use

- allocation
- allocation-free
- GC pressure
- Span
- ArrayPool
- ValueTask
- BenchmarkDotNet

## Role in workflow

This is review lens step 12 in the full workflow. It may read upstream findings from `sharp-performance-review, sharp-analyzer-policy-review` and may hand off to `sharp-test-review`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-performance-review, sharp-analyzer-policy-review`
- Hands off to: `sharp-test-review`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/allocation-free-recommendation-layer.md`
- `resources/allocation-hotspot-guide.md`
- `resources/allocation-output-contract.md`
- `resources/benchmarking-execution-guide.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
