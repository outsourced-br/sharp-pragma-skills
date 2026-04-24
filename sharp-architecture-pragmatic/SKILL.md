---
name: sharp-architecture-pragmatic
description: "Review .NET architecture boundaries pragmatically without prescribing DDD or unnecessary layers. Use for clean architecture, project boundaries, dependency direction, overengineering, abstraction removal, and project splitting questions."
---

# Pragmatic architecture review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review clean architecture boundaries pragmatically without DDD prescription or unnecessary layer expansion.

## When to use

- clean architecture
- layering
- dependencies between projects
- project splitting

## Role in workflow

This is review lens step 6 in the full workflow. It may read upstream findings from `sharp-analyzer-policy-review, sharp-build-conventions` and may hand off to `sharp-code-quality-review`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-analyzer-policy-review, sharp-build-conventions`
- Hands off to: `sharp-code-quality-review`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/abstraction-removal-playbook.md`
- `resources/anti-overengineering-heuristics.md`
- `resources/clean-architecture-pragmatic-checklist.md`
- `resources/layering-and-dependency-rules.md`
- `resources/project-splitting-heuristics.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
