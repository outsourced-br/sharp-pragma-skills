# Severity and reporting model

Every finding must use this schema.

## Finding schema

```text
ID: <SKILL-CODE>-NNN
Severity: Critical | Major | Minor | Informational
Category: Architecture | Build | Dependencies | Analyzer | Code Quality | Design | Performance | Allocation | Test | Security | Reporting
Location: <file/path:line if known>
Evidence: <what was observed>
Impact: <why it matters>
Recommendation: <specific correction>
Confidence: High | Medium | Low
Effort: S | M | L
Owner: Human | Agent | Either
Companion handoff: <optional downstream skill>
```

## Severity rules

- Critical: unsupported runtime in production, exploitable security risk, broken restore/build/test pipeline, data loss risk, or severe runtime correctness issue.
- Major: strong maintainability, migration, dependency, security, performance, or architecture risk that should be fixed before relying on the codebase.
- Minor: localized design/code/build issue with limited impact.
- Informational: observation, suggestion, or future improvement with no immediate risk.

## False-positive discipline

If evidence is weak, downgrade the finding or mark it as `Needs evidence`. Do not inflate severity to make the report look useful.
