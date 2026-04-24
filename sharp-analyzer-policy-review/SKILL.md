---
name: sharp-analyzer-policy-review
description: "Review .NET analyzer policy including Roslyn analyzers, .editorconfig, code-quality/security/performance/test profiles, dotnet format, warnings-as-errors rollout, and SDK versus package analyzers. Use for analyzer configuration, warning policy, code analysis, and staged migration questions."
---

# Analyzer policy review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review analyzer profiles for code quality, security, performance, tests, and staged migration.

## When to use

- analyzers
- .editorconfig
- warnings as errors
- code analysis
- Roslyn analyzers

## Role in workflow

This is review lens step 5 in the full workflow. It may read upstream findings from `sharp-nuget-dependency-review, sharp-build-conventions` and may hand off to `sharp-architecture-pragmatic, sharp-code-quality-review, sharp-performance-review, sharp-security-hygiene`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-nuget-dependency-review, sharp-build-conventions`
- Hands off to: `sharp-architecture-pragmatic, sharp-code-quality-review, sharp-performance-review, sharp-security-hygiene`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/analyzer-profile-guide.md`
- `resources/dotnet-format-guide.md`
- `resources/editorconfig-baseline.md`
- `resources/sdk-package-analyzers.md`
- `resources/warnings-as-errors-rollout.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
