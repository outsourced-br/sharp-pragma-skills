---
name: sharp-nuget-dependency-review
description: "Review NuGet and dependency health including vulnerable, deprecated, outdated, and transitive packages, central package management, lock files, package source mapping, NuGet audit policy, and update strategy. Use for dependency, package, vulnerability, restore, and package-source questions."
---

# NuGet and dependency review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review NuGet package health, vulnerability/deprecation/outdated status, transitive dependencies, source mapping, lock files, and update strategy.

## When to use

- NuGet
- dependencies
- vulnerable packages
- outdated packages
- Central Package Management

## Role in workflow

This is review lens step 4 in the full workflow. It may read upstream findings from `sharp-build-conventions` and may hand off to `sharp-analyzer-policy-review, sharp-security-hygiene`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-build-conventions`
- Hands off to: `sharp-analyzer-policy-review, sharp-security-hygiene`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/central-package-management-guide.md`
- `resources/dependency-status-checklist.md`
- `resources/lock-file-policy.md`
- `resources/nuget-audit-policy-guide.md`
- `resources/package-source-mapping-guide.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
