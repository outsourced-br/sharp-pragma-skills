# dotnet format guide

Use `dotnet format` to enforce formatting and analyzer/style baselines.

Common CI check:

```bash
dotnet format --verify-no-changes
```

Use after `.editorconfig` is agreed and baseline churn is controlled. Do not combine first-time formatting, analyzer tightening, package upgrades, and architecture refactors in the same automated change unless the user explicitly asks.
