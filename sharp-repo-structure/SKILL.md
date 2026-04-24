---
name: sharp-repo-structure
description: "Review repository layout, source/test/docs/specs/artifacts separation, naming, generated outputs, and migration risk. Use for folder structure questions, src versus source layout, misplaced artifacts, repo organization, or layout cleanup plans."
---

# Repository structure review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review repository layout, source/test/docs/specs/artifacts folders, naming, generated outputs, and migration risk.

## When to use

- folder structure
- src vs source
- docs/specs/artifacts layout
- repo organization

## Role in workflow

This is review lens step 2 in the full workflow. It may read upstream findings from `sharp-solution-audit` and may hand off to `sharp-build-conventions`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-solution-audit`
- Hands off to: `sharp-build-conventions`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/data-vs-fixtures-guidance.md`
- `resources/migration-playbook.md`
- `resources/naming-conventions.md`
- `resources/recommended-folder-map.md`
- `resources/structure-review-checklist.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
