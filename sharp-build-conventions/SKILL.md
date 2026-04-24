---
name: sharp-build-conventions
description: "Review .NET build conventions including Directory.Build.props, Directory.Build.targets, Directory.Packages.props, SDK pinning, output paths, package management, warning policy, and CI reproducibility. Use for build conventions, props/targets, central package files, and reproducible CI concerns."
---

# Build conventions review

Package: SharpPragma Skills  
Skill version: 3.0.0  
Routing type: review lens

## Purpose

Review Directory.Build.props, Directory.Build.targets, Directory.Packages.props, SDK pinning, output conventions, and CI reproducibility.

## When to use

- Directory.Build.props
- Directory.Build.targets
- Directory.Packages.props
- build conventions
- CI reproducibility

## Role in workflow

This is review lens step 3 in the full workflow. It may read upstream findings from `sharp-repo-structure` and may hand off to `sharp-nuget-dependency-review`. It must not invoke companion skills recursively.

## Companion skills

Companion skills are non-recursive context references. Do not use this section as a graph traversal instruction.

- Receives context from: `sharp-repo-structure`
- Hands off to: `sharp-nuget-dependency-review`

## Guardrails

- Follow `docs/shared-guardrails.md`.
- Use `docs/severity-and-reporting-model.md` for every finding.
- Stay DDD-neutral. Do not introduce DDD-specific terminology or structure.
- Prefer the smallest safe correction over broad rewrites.
- Clearly distinguish evidence, inference, and recommendation.

## Resources

- `resources/build-file-responsibilities.md`
- `resources/central-output-conventions.md`
- `resources/ci-reproducibility-guide.md`
- `resources/package-management-checklist.md`
- `resources/sample-directory-build-props.md`
- `resources/sample-directory-build-targets.md`
- `resources/sample-directory-packages-props.md`

## Output

Return findings using the shared finding schema. If no material findings exist, state that explicitly and include any low-risk observations as Informational.
