---
name: sharp-composition-over-inheritance
description: "Review inheritance usage and recommend composition only when it is simpler and safer. Use for fragile base classes, base constructors calling virtual methods, deep hierarchies, template method risks, strategy migration, and inheritance false-positive checks."
---

# Composition over inheritance review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review harmful inheritance and recommend composition only when simpler and safer.

## When to use

- inheritance
- composition
- base class
- virtual template method

## Role in workflow

This is review lens step 10 in the full workflow. It may read upstream findings from `sharp-solid-deep-review` and may hand off to `sharp-performance-review`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-solid-deep-review`
- Hands off to: `sharp-performance-review`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/composition-migration-patterns.md`
- `resources/composition-review-output-contract.md`
- `resources/fragile-base-class-smells.md`
- `resources/inheritance-acceptable-use-cases.md`
- `resources/inheritance-review-checklist.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
