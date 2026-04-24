---
name: sharp-solid-deep-review
description: "Review SOLID principles only where concrete maintainability, testing, extension, substitution, interface, or dependency risks exist. Use for SRP, OCP, LSP, ISP, DIP, dependency inversion, and SOLID false-positive analysis."
---

# SOLID deep review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review SOLID violations only when they cause concrete maintainability, testing, extension, or dependency risk.

## When to use

- SOLID
- SRP
- OCP
- LSP
- ISP
- DIP

## Role in workflow

This is review lens step 9 in the full workflow. It may read upstream findings from `sharp-design-principles-review` and may hand off to `sharp-composition-over-inheritance`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-design-principles-review`
- Hands off to: `sharp-composition-over-inheritance`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/solid-false-positives.md`
- `resources/solid-output-contract.md`
- `resources/solid-refactor-playbook.md`
- `resources/solid-review-checklist.md`
- `resources/solid-severity-guide.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
