# Shared guardrails

These guardrails apply to every SharpPragma skill.

## DDD-neutrality

Do not prescribe DDD. Do not introduce aggregates, repositories, domain events, bounded contexts, shared kernels, or DDD-specific naming unless the repository already uses those patterns and the review is about consistency within the existing codebase.

Use neutral terms:

| Prefer | Avoid as prescription |
|---|---|
| core project | domain layer |
| business model | entity |
| small immutable value-semantic type | value object |
| application event / internal message | domain event |
| shared primitives / shared abstractions | shared kernel |

## Evidence before refactor

Do not recommend a change as a refactor unless at least one is true:

- The defect breaks build, test, security, dependency health, or runtime correctness.
- The problem directly violates a stated project standard.
- The code causes measurable operational, maintainability, or performance risk.
- The user explicitly asked for that class of change.

Otherwise classify the item as `Consider`, `Informational`, or `Needs evidence`.

## Performance and allocation

No performance or allocation rewrite may be proposed as a concrete refactor without evidence. Acceptable evidence includes benchmark output, profiler traces, counters, production telemetry, known hot-path status, high-volume import/export paths, or a clear user request to investigate that area.

## Anti-overengineering

Do not recommend:

- interfaces for every class
- layers for every feature
- generic abstractions before repetition exists
- complete rewrites when a small correction is enough
- 100% coverage as a blanket goal
- `latest` language version or global warnings-as-errors without rollout context
