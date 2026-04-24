---
name: sharp-full-solution-review
description: "Coordinate a broad or repository-wide .NET review by running the SharpPragma review lenses in the documented order and merging findings. Use when the user asks for a full solution review, whole-repo audit, architecture and code review, or cross-cutting review report."
---

# Full solution review orchestrator

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: orchestrator

## Purpose

Coordinate a complete .NET review across the fifteen review lenses and merge the findings into one coherent report.

## When to use

- full review
- entire solution review
- repo-wide review
- architecture and code review

## Role in workflow

Run the fifteen review lenses in the order defined by `docs/review-workflow.md`. Do not follow companion links recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `User request`
- Hands off to: `All review lenses in order`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/findings-handoff-protocol.md`
- `resources/orchestration-guide.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
