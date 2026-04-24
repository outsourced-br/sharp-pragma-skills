---
name: sharp-design-principles-review
description: "Review pragmatic design principles including KISS, DRY, YAGNI, Tell Don't Ask, reuse quality, speculative abstraction, and false-positive resistance. Use for design-principle reviews, duplication questions, abstraction smells, and simplicity-focused refactoring guidance."
---

# Design principles review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review KISS, DRY, YAGNI, Tell Don't Ask, reuse quality, and speculative abstraction.

## When to use

- KISS
- DRY
- YAGNI
- Tell Don't Ask
- abstraction smells

## Role in workflow

This is review lens step 8 in the full workflow. It may read upstream findings from `sharp-code-quality-review` and may hand off to `sharp-solid-deep-review`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-code-quality-review`
- Hands off to: `sharp-solid-deep-review`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/design-principles-checklist.md`
- `resources/design-review-output-contract.md`
- `resources/healthy-vs-harmful-reuse.md`
- `resources/kiss-dry-yagni-tell-dont-ask-heuristics.md`
- `resources/speculative-abstraction-smells.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
