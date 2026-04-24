# Review workflow

This document defines the only full-solution workflow.

## Entry point

Use `sharp-full-solution-review` when the user asks for a broad or repository-wide review. It is the orchestrator. It is not counted as one of the fifteen review lenses because it does not perform a separate technical review; it coordinates the lenses and merges their findings.

## Review lenses

| Step | Skill | Role |
|---:|---|---|
| 1 | `sharp-solution-audit` | Identify solution shape, target frameworks, project graph, obvious risk areas, and scope. |
| 2 | `sharp-repo-structure` | Review folder layout, naming, artifacts, docs, source/test separation, and migration risk. |
| 3 | `sharp-build-conventions` | Review props/targets, output paths, central build files, SDK pinning, CI conventions, and reproducibility. |
| 4 | `sharp-nuget-dependency-review` | Review packages, transitive dependencies, NuGet audit, source mapping, lock files, and update strategy. |
| 5 | `sharp-analyzer-policy-review` | Review analyzers, `.editorconfig`, code-quality/security/performance analyzer profile, and rollout strategy. |
| 6 | `sharp-architecture-pragmatic` | Review clean architecture boundaries without DDD prescription. |
| 7 | `sharp-code-quality-review` | Review naming, cohesion, async/resource management, nullability, exceptions, logging, and maintainability. |
| 8 | `sharp-design-principles-review` | Review KISS, DRY, YAGNI, Tell Don't Ask, and speculative abstraction. |
| 9 | `sharp-solid-deep-review` | Review SOLID only where concrete violations affect maintainability or testing. |
| 10 | `sharp-composition-over-inheritance` | Review harmful inheritance and migration to composition when justified. |
| 11 | `sharp-performance-review` | Review measurable performance risks and create profiling/benchmark plans when evidence is missing. |
| 12 | `sharp-allocation-review` | Review allocation hotspots using performance context and benchmark evidence. |
| 13 | `sharp-test-review` | Review test strategy, coverage usefulness, naming, fixture design, mocks, and scenario tests. |
| 14 | `sharp-security-hygiene` | Review secrets, config, auth boundaries, dependency hygiene, insecure defaults, and production exposure. |
| 15 | `sharp-code-review-reporting` | Normalize findings, remove duplicates, assign severities, and produce the final report. |

## Companion skills are not routing loops

Companion skills are references only. They help a skill understand upstream context or downstream handoff. They are not instructions to recursively invoke another skill.

Agents must not follow companion links as a graph traversal. Only the orchestrator may sequence a full review.

## Optional scoping

For targeted user requests, run only the relevant skill and any explicitly necessary upstream evidence-gathering skill. Example: a NuGet vulnerability request should use `sharp-nuget-dependency-review` and may hand off to `sharp-security-hygiene`, but it does not need the entire workflow.
