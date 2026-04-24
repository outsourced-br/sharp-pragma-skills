---
name: sharp-security-hygiene
description: "Review security hygiene including secrets, configuration, auth boundaries, dependency hygiene, insecure defaults, production exposure, and severity calibration. Use for security reviews, leaked credentials, missing authorization, vulnerable dependencies, and config exposure."
---

# Security hygiene review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review secrets, config, dependency hygiene, auth assumptions, insecure defaults, and production security posture.

## When to use

- security
- secrets
- auth
- config
- dependency vulnerability

## Role in workflow

This is review lens step 14 in the full workflow. It may read upstream findings from `sharp-nuget-dependency-review, sharp-analyzer-policy-review, sharp-test-review` and may hand off to `sharp-code-review-reporting`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-nuget-dependency-review, sharp-analyzer-policy-review, sharp-test-review`
- Hands off to: `sharp-code-review-reporting`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/auth-patterns-checklist.md`
- `resources/dependency-hygiene-checklist.md`
- `resources/secrets-and-config-review.md`
- `resources/security-review-output-contract.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
