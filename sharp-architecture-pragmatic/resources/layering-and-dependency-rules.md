# Layering and dependency rules

Healthy direction:

```text
Entry point -> Application/workflows -> Core/business rules
Entry point -> Infrastructure adapters
Application -> abstractions for IO when useful
Infrastructure -> implements IO abstractions
```

Warning signs:

- business logic depends directly on database, HTTP, file system, UI, or vendor SDKs without a reason,
- infrastructure types leak through application boundaries,
- layers exist but are bypassed everywhere,
- or layers are added with no testability or change-rate payoff.
