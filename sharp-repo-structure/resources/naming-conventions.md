# Naming conventions

Prefer names that describe responsibility without importing a design philosophy.

Examples:

| Good neutral name | Notes |
|---|---|
| `App.Core` | Inner business rules or core abstractions. |
| `App.Application` | Use cases, workflows, orchestration. |
| `App.Infrastructure` | IO, persistence, external services. |
| `App.Api` | HTTP entry point. |
| `App.Cli` | CLI entry point. |
| `App.Tests` | Tests. |

Existing names such as `App.Domain` are not automatically wrong. Do not recommend renaming without a concrete consistency or comprehension problem.
