---
name: sharp-solution-audit
description: "Map a .NET solution before deeper review by identifying projects, target frameworks, entry points, build and test commands, project graph risks, and review scope. Use for initial audits, solution inventory, target framework policy, project graph questions, or modernization triage."
---

# Solution audit

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Map the solution shape, target frameworks, project graph, entry points, and review scope before deeper skills run.

## When to use

- initial audit
- what is in this solution
- target frameworks
- project graph

## Role in workflow

This is review lens step 1 in the full workflow. It may read upstream findings from `sharp-full-solution-review` and may hand off to `sharp-repo-structure`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-full-solution-review`
- Hands off to: `sharp-repo-structure`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/audit-output-contract.md`
- `resources/audit-template.md`
- `resources/dotnet-version-language-policy.md`
- `resources/false-positive-guardrails.md`
- `resources/modernization-decision-guide.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
