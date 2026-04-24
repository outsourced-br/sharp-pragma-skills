---
name: sharp-code-review-reporting
description: "Normalize code review findings, deduplicate overlapping reports, apply severity rules, fix weak evidence, remove contradictory guidance, and produce final actionable review reports. Use for final reporting, severity calibration, implementation plans, and findings handoff cleanup."
---

# Code review reporting

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Normalize findings, deduplicate contradictions, apply severity rules, and produce the final review report.

## When to use

- final report
- findings
- severity
- implementation plan

## Role in workflow

This is review lens step 15 in the full workflow. It may read upstream findings from `All prior skills` and may hand off to `Final report`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `All prior skills`
- Hands off to: `Final report`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/architecture-review-style-guide.md`
- `resources/finding-id-and-location-conventions.md`
- `resources/findings-severity-matrix.md`
- `resources/implementation-plan-template.md`
- `resources/review-report-template.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
